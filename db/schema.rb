# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_506_050_924) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'followers', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'workshop_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_followers_on_user_id'
    t.index ['workshop_id'], name: 'index_followers_on_workshop_id'
  end

  create_table 'pieces', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.decimal 'price'
    t.string 'materials'
    t.string 'dimensions'
    t.boolean 'sold'
    t.bigint 'user_id'
    t.bigint 'workshop_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'tags', default: [], array: true
    t.index ['user_id'], name: 'index_pieces_on_user_id'
    t.index ['workshop_id'], name: 'index_pieces_on_workshop_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'admin'
    t.boolean 'artist'
    t.string 'full_name'
    t.string 'secret_question'
    t.string 'encrypted_secret'
    t.string 'address'
    t.string 'phone'
    t.string 'tags', default: [], array: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'workshops', force: :cascade do |t|
    t.string 'bio'
    t.string 'bank_account'
    t.string 'auto_respond_msg'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_workshops_on_user_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'followers', 'users'
  add_foreign_key 'followers', 'workshops'
  add_foreign_key 'pieces', 'users'
  add_foreign_key 'pieces', 'workshops'
  add_foreign_key 'workshops', 'users'
end
