class PostManager
  require "httpx"

  def initialize

  end

  def self.make_url(authentication_token,url="")
      url_path = 'http://localhost:8080'

      base_uri = url_path+"/api/v1"
      authentication_token = "?authentication_token=#{authentication_token}"
      (url.include?("/auth/sign_in?") ? url_path+url : base_uri+url+authentication_token)
  end


  def self.post_request(url,authentication_token,body)
    complete_url = make_url(authentication_token,url)

    response = HTTPX.post(complete_url,:json => body)

    response.status == 200 ?  JSON.parse(response.body)  : nil
  end

  def self.get_request(url,authentication_token=nil)

    complete_url = make_url(authentication_token,url)

    response = HTTPX.get(complete_url)

    response.status == 200 ?  JSON.parse(response.body)  : nil
  end

end