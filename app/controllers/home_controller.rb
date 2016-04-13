require 'mailgun'

class HomeController < ApplicationController
    
    def index
    end
    
    def done
        @title = params[:title]
        @reemail = params[:reemail]
        @message = params[:message] 
        
        @team = "함께한 4기 - (세일러문) 조유림, 이지훈, 이소희, 송은지 \n";
        @lotto = "로또번호는" + (1..45).to_a.sample(6).to_s + "굿럭!\n";
        
        mg_client = Mailgun::Client.new("key-81e33197450cdeb1346f8ef8238e746a")

        message_params =  {
                   from: 'salermoon@likelion.net',
                   to:   @reemail,
                   subject: @title,
                   text:   @team + @lotto +  @message
                  }

        result = mg_client.send_message('sandbox8db01a638747492f9670be4222f4543e.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
        
    end
    
end
