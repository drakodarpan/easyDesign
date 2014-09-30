require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "debe poder crear un post" do
    post = Post.create(titulo: "Mi titulo", contenido: "Mi contenido")
    assert post.save
  end

  test "debe actualizar un post" do
    post = posts(:primer_articulo)
    assert post.update(titulo: "Nuevo titulo", contenido: "Nuevo contenido")
  end

  test "debe encontrar un post por su id" do
    post_id = posts(:primer_articulo).id
    assert_nothing_raised { Post.find(post_id) }
  end

  test "debe borrar un post" do
    post = posts(:primer_articulo)
    post.destroy
    assert_raise(ActiveRecord::RecordNotFound) { Post.find(post.id) }
  end

  test "no debe crear un post sin titulo" do
    post = Post.new
    assert post.invalid?, "El post deberia ser invalido"
  end

  test "cada titulo tiene que ser unico" do
    post = Post.new
     post.titulo = posts(:primer_articulo).titulo
     assert post.invalid?, "Dos posts no pueden tener el mismo titulo"
  end

end
