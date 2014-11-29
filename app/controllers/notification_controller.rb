require 'gcm'
class NotificationController < ApplicationController
  def sendETA
  #     gcm = GCM.new("AIzaSyA87hZqNV_EI1x_rOho9JlcggVCQMgvH0Y")
  #     client_registration_id = ["APA91bHym4w24gdTe40t-qwwY53Y2JJml0PDq0UIN7JFLhYswWPl47YCoHETNIvCGSEeRC7ULkmAkZIVEWBO3l_pBUI45Jc8588DC8IL_g4Nae8jeI2OXuwymmeZ0QrtIjXJNU6BM03f6uOWtdTbEjg1RPesooZpWw"]
  #     options = {data: {
  #     		        GCM_MSG_SENDER_NAME: "kumari",
  #     		        GCM_MSG_SENDER_PHONE_NUMBER: "510555000",
  #     		        GCM_MSG_LONGITUDE: 2.2,
  #     		        GCM_MSG_LATITUDE: 9.0,
  #     		        GCM_MSG_ETA: 1200
  # 			}
		# }	
  #     @response = gcm.send(client_registration_id, options)
  	 logger.info " ---- Send ETA params #{params}"
  	 respond_to do |format|
  	 	format.json { head :ok}
  	 end
  end
end
