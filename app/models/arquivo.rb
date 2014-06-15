class Arquivo < ActiveRecord::Base
  attr_accessible :arquivos,:arquivo, :descricao
  belongs_to :anexo, :polymorphic => true

  ATTACHMENT_SIZE_ERROR = ' O arquivo deve ter, no máximo, 3.0 MB. '
  ATTACHMENT_CONTENT_TYPE = ' O arquivo deve estar no formato JPG. '
  CAMINHO_SALVAMENTO_ARQUIVOS = ":rails_root/public/arquivos/:attachment/:id/:filename"     #ver o caminho certo

  has_attached_file :arquivo,:styles => { :medium => "500x400>"}, :path => CAMINHO_SALVAMENTO_ARQUIVOS,:url => ":class/:id/:basename.:extension"
  validates_attachment_content_type :arquivo, :content_type => ['image/jpeg', 'image/jpg', 'image/png' ], :message => ATTACHMENT_CONTENT_TYPE
  validates_attachment_presence :arquivo
  validates_attachment_size :arquivo, :less_than => 3.megabytes, :message => ATTACHMENT_SIZE_ERROR




end
