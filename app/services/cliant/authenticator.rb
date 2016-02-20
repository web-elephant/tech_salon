class Cliant::Authenticator
  def initialize(cliant)
    @cliant = cliant
  end

  def authenticate(raw_password)
    @cliant &&
      @cliant.hashed_password &&
      BCrypt::Password.new(@cliant.hashed_password) == raw_password
    end
  end