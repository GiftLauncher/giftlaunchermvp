require 'spec_helper'

describe Gift do

  describe "attachments" do
    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }

    it { should validate_attachment_content_type(:image)
                .allowing('image/png', 'image/gif', 'image/jpg', 'image/jpeg')
                .rejecting('text/plain', 'text/xml') }

    it { should validate_attachment_size(:image)
                .in(0..2.megabytes) }
  end
end
