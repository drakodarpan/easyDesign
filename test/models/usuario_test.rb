require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "debe crear un usuario" do
    u = Usuario.new(username: "david", email: "david@example.com", password: "12345678")
    assert u.save
  end

  test "debe crear un usuario sin que exista un email" do
    u = Usuario.new(username: "david", password: "12345678")
    assert u.save
  end
end
