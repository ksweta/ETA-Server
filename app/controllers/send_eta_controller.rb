require 'gcm'
class SendEtaController < ApplicationController
  def sendMessage
      gcm = GCM.new("AIzaSyA87hZqNV_EI1x_rOho9JlcggVCQMgvH0Y")
      registration_ids = ["APA91bHym4w24gdTe40t-qwwY53Y2JJml0PDq0UIN7JFLhYswWPl47YCoHETNIvCGSEeRC7ULkmAkZIVEWBO3l_pBUI45Jc8588DC8IL_g4Nae8jeI2OXuwymmeZ0QrtIjXJNU6BM03f6uOWtdTbEjg1RPesooZpWw"]
      options = {data: {msg:"your ETA is 20 mins !"}}
      @response = gcm.send(registration_ids, options)
  end
end
