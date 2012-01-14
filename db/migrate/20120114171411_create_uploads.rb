class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :checksum
      t.string :error
      t.decimal :total, :precision => 16, :scale => 2
      t.decimal :partial, :precision => 16, :scale => 2
  
      t.string :document_file_name
      t.string :document_content_type
      t.integer :document_file_size
      t.datetime :document_updated_at

      t.timestamps
    end
  end
end
