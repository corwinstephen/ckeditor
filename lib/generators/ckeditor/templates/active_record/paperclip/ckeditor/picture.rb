class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :styles => { :medium => '1000x1000>', :medium_square => '400x400#', :thumb => '100x100#' },
                    :storage => :s3,
                    :path => "/:class/:id/:style/:filename",
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :url => ':s3_domain_url'

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_content_type :data, :content_type => /\Aimage/

  def url_content
    url(:content)
  end
end
