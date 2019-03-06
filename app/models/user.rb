class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true , # nameは入力必須
             length: { maximum: 50 } # nameは最大50文字
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #メールアドレスのフォーマットの定数
  validates :email, presence: true, # emailは入力必須
             length: { maximum: 255 }, # emailは最大255文字
             format: { with: VALID_EMAIL_REGEX }, # emailはフォーマットに従う
             uniqueness: { case_sensitive: false } # emailは一意性をもつかつ大文字小文字を無視する
  has_secure_password # ユーザーがセキュアなパスワードをもっている
  validates :password, presence: true, length: { minimum:6 } # パスワードは最低6文字
end
