class AddingQuantityUploadToPurchase < ActiveRecord::Migration
  def up
    add_column :purchases, :quantity, :integer, :default => 0
    add_column :purchases, :upload_id, :integer
    rename_column :uploads, :checksum, :document_fingerprint
  end

  def down
    remove_column :purchases, :quantity
    remove_column :purchases, :upload_id
    rename_column :uploads, :document_fingerprint, :checksum
  end
end
