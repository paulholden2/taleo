# frozen_string_literal: true

require 'taleo/resource'

module Taleo
  class Attachment < Resource
    def id
      data.fetch('id')
    end

    def type
      data.fetch('attachmentType')
    end

    def content_type
      data.fetch('contentType')
    end

    def can_download?
      data.key?('downloadUrl')
    end

    def download
      unless can_download?
        raise Error.new("Attachment #{id} is not available for download")
      end

      client.download(data.fetch('downloadUrl'))
    end
  end
end
