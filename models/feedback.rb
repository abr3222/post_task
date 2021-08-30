class Feedback < ActiveRecord::Base
  belongs_to :feedbackable, :polymorphic => true
  has_one :owner, :class_name => 'User', :foreign_key => 'id'

  def self.generate_xml_report
    content = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.root do
        xml.feedbacks do
          Feedback.includes(:owner).each do |feedback|
            xml.feedback do
              xml.owner feedback.owner.user_name
              xml.comment_ feedback.comment
              xml.feedback_type feedback.feedbackable_type
              xml.average_rating feedback.feedbackable_type == 'User' ? [] : feedback.feedbackable.average_rating
            end
          end
        end
      end
    end
    File.write("reports/#{Time.now.strftime('%Y%m%d%H%M%S')}_feedback_report.xml", content.to_xml)
  end

  # User.create(user_name: "Hafiz ABR")
  # User.create(user_name: "Hafiz Hassan")
  #
  # IpAddress.create(ip:"192.168.1.1")
  #
  # Post.create(title:"First PoST" , content:"Yahoo" ,user_id: User.first.id,ip_address:IpAddress.first)
  # Post.create(title:"Second PoST" , content:"Yahoo" ,user_id: User.last.id,ip_address:IpAddress.first)
  #
  #
  #
  # Feedback.create(feedbackable: User.first,comment:"Yes",owner_id: User.first.id)
  # Feedback.create(feedbackable: Post.first,comment:"Yes",owner_id: User.first.id)
  #
  # Rating.create(value:3 , post_id: Post.first.id)
  # Post.first.ratings.count
  # Post.first.ratings.count

  # #Count the feed back
  #
  # IpAddress.first.posts.count
  #
  # User.first.posts.count
  # User.first.feedback.count
  #
  # Feedback.first.feedbackable.feedbacks.count #BY USER
  # Feedback.last.feedbackable.feedbacks.count #BY Post
end