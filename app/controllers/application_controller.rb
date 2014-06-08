class ApplicationController < ActionController::Base
  protect_from_forgery


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def home
    #@users = User.all
    @noticias = Noticia.paginate(:page => params[:page])
  end

  def contato
    ContatoMailer.contato(params)
    redirect_to :root, :notice => "Sua mensagem foi enviada com sucesso. Aguarde nosso retorno."
  end

end
