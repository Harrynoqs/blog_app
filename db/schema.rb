ActiveRecord::Schema[7.0].define(version: 2023_01_26_080452) do
    
    enable_extension "plpgsql"
  
    create_table "comments", force: :cascade do |t|
      t.integer "AuthorId"
      t.integer "PostId"
      t.text "Text"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["AuthorId"], name: "index_comments_on_AuthorId"
      t.index ["PostId"], name: "index_comments_on_PostId"
    end
  
    create_table "likes", force: :cascade do |t|
      t.integer "AuthorId"
      t.integer "PostId"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["AuthorId"], name: "index_likes_on_AuthorId"
      t.index ["PostId"], name: "index_likes_on_PostId"
    end
  
    create_table "posts", force: :cascade do |t|
      t.integer "AuthorId"
      t.string "Title"
      t.text "Text"
      t.integer "CommentCounter", default: 0
      t.integer "LikeCounter", default: 0
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["AuthorId"], name: "index_posts_on_AuthorId"
    end
  
    create_table "users", force: :cascade do |t|
      t.string "Name"
      t.text "Bio"
      t.integer "PostCounter", default: 0
      t.string "Image"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    add_foreign_key "comments", "posts", column: "PostId"
    add_foreign_key "comments", "users", column: "AuthorId"
    add_foreign_key "likes", "posts", column: "PostId"
    add_foreign_key "likes", "users", column: "AuthorId"
    add_foreign_key "posts", "users", column: "AuthorId"
  end