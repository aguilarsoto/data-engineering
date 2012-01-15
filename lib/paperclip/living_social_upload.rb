require 'paperclip'
require "csv"

module Paperclip
  class LivingSocialUpload < Processor

    def initialize (file, options = {}, attachment = nil)
      super
      @document = file
      @upload = attachment.instance
    end

    def make
      return @document if @upload.id.nil?
      begin 
        @partial = 0
        CSV.new(
          @document,
          :col_sep => "\t",
          :row_sep => :auto,
          :headers => true,
          :header_converters => :symbol,
          :converters => proc { |v| v.force_encoding('UTF-8') }
        ).each do |row|
          
          Merchant.transaction do
            merchant = Merchant.where(
              :name    => row[:merchant_name],
              :address => row[:merchant_address]).first
            merchant ||= Merchant.create!(
              :name    => row[:merchant_name],
              :address => row[:merchant_address])

            item = Item.where(
              :description  =>row[:item_description],
              :price        => row[:item_price],
              :merchant_id  => merchant.id).first
            item ||= Item.create!(
              :description => row[:item_description], 
              :price       => row[:item_price],
              :merchant_id => merchant.id)

            purchaser = Purchaser.where(:name => row[:purchaser_name]).first
            purchaser ||= Purchaser.create!(:name => row[:purchaser_name])

            purchase ||= Purchase.create!(
              :quantity  => row[:purchase_count],
              :item      => item,
              :purchaser => purchaser,
              :upload    => @upload)
            @partial += (purchase.quantity * item.price)
          end
        end
      rescue Exception => e
        @upload.update_attributes(:error => "#{e.message}, please review the uploaded file")
      end
      @upload.update_attribute(:partial, @partial)
      @document
    end
  end
end
