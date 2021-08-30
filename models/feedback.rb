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

end