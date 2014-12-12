require 'gcm'
class NotificationController < ApplicationController

  def sendETA
    #     gcm = GCM.new("AIzaSyA87hZqNV_EI1x_rOho9JlcggVCQMgvH0Y")
    #     client_registration_id = ["APA91bHym4w24gdTe40t-qwwY53Y2JJml0PDq0UIN7JFLhYswWPl47YCoHETNIvCGSEeRC7ULkmAkZIVEWBO3l_pBUI45Jc8588DC8IL_g4Nae8jeI2OXuwymmeZ0QrtIjXJNU6BM03f6uOWtdTbEjg1RPesooZpWw"]
    #     options = { data: {
    #     		               GCM_MSG_SENDER_NAME: "kumari",
    #     		               GCM_MSG_SENDER_PHONE_NUMBER: "510555000",
    #     		               GCM_MSG_LONGITUDE: 2.2,
    #     		               GCM_MSG_LATITUDE: 9.0,
    #     		               GCM_MSG_ETA: 1200
    # 			               }
    #                }	
    #     @response = gcm.send(client_registration_id, options)
  	logger.info " ---- Send ETA params #{params}"
     
  	respond_to do |format|
      @user = User.find_by_phoneNumber(params[:GCM_MSG_RECEIVER_PHONE_NUMBER])
      logger.info " ---- Send ETA User : #{@user}"
      unless @user.nil?
        gcm = GCM.new("AIzaSyA87hZqNV_EI1x_rOho9JlcggVCQMgvH0Y")
        
        options = {  data:{
                            GCM_MSG_RECEIVER_PHONE_NUMBER: params[:GCM_MSG_RECEIVER_PHONE_NUMBER], 
                            GCM_MSG_SENDER_NAME: params[:GCM_MSG_SENDER_NAME],
                            GCM_MSG_SENDER_PHONE_NUMBER: params[:GCM_MSG_SENDER_PHONE_NUMBER],
                            GCM_MSG_SRC_LATITUDE: params[:GCM_MSG_SRC_LATITUDE],
                            GCM_MSG_SRC_LONGITUDE: params[:GCM_MSG_SRC_LONGITUDE],
                            GCM_MSG_DST_LATITUDE: params[:GCM_MSG_DST_LATITUDE],
                            GCM_MSG_DST_LONGITUDE: params[:GCM_MSG_DST_LONGITUDE],
                            GCM_MSG_ETA: params[:GCM_MSG_ETA]
                          }
                   }
        logger.info " ---- Send ETA GCM option : #{options}"
        logger.info " ---- Send ETA client registration : #{@user.clientRegistrationId}"
        response = gcm.send([@user.clientRegistrationId], options)
        #logger.info " --- Send ETA GCM response type: #{response.class.name}, response : #{response}"
        if response[:status_code] == 200
  	 	    format.json {head :ok}
        else 
          format.json { render json: response, status: :not_found}
        end 
      else
        error_msg = { :error => "User(#{params[:phoneNumber]}) is not registered with ETA" }
        format.json { render json: error_msg, status: :not_found }
  	  end # end of unless
    end # end of format
  end
end