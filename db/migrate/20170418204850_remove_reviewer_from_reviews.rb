class RemoveReviewerFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :reviewer, :string
  end
end
