module Picturable
  extend ActiveSupport::Concern
  
  included do
    after_save :guardar_imagen
  end

  # File.join Concatena a la ruta ( Rail.root ) + public + archivo
  # Queda de la siguiente manera: home/user/public/archivo
  PATH_ARCHIVOS = File.join Rails.root, "public", "archivo"

  def archivo=(archivo)
    unless archivo.blank?
      # Variables de clase, inician con una @
      @archivo = archivo
      if self.respond_to?(:name)
        self.nombre = archivo.original_filename
      end
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
