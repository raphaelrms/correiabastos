class RemoveCursoFromArquivos < ActiveRecord::Migration
  def change
    remove_column :arquivos, :curso_id
  end
end
