class Attachment < ActiveRecord::Base
  # Cuando se pone post:references se genera el belongs_to
  belongs_to :post
  after_save :guardar_imagen

  # File.join Concatena a la ruta ( Rail.root ) + public + archivo
  # Queda de la siguiente manera: home/user/public/archivo
  PATH_ARCHIVOS = File.join Rails.root, "public", "archivo"

  def archivo=(archivo)
    unless archivo.blank?
      # Variables de clase, inician con una @
      @archivo = archivo
      self.nombre = archivo.original_filename
      self.extension = archivo.original_filename.split(".").last.downcase
    end
  end

  def path_archivo
    File.join PATH_ARCHIVOS, "#{self.id}.#{self.extension}"
  end

  def tiene_archivo?
    File.exists? path_archivo
  end

  private
    def guardar_imagen
      if @archivo
        FileUtils.mkdir_p PATH_ARCHIVOS
        File.open(path_archivo, "wb") do |f|
          f.write(@archivo.read)
        end
        @archivo = nil
      end
    end

end
