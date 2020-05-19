defmodule SistemaCompra.Helps do
  import Ecto.Query, warn: false
  alias SistemaCompra.Repo
  alias SistemaCompra.UsuarioModel
  alias SistemaCompra.ProdutoModel
  alias SistemaCompra.CompraModel

  def create(attrs \\ %{}) do
    %UsuarioModel{}
    |> UsuarioModel.changeset(attrs)
    |> Repo.insert()
  end

  def query_usuario(id) do
    query =
      from usuario in UsuarioModel,
        where: usuario.id == ^id,
        select: usuario.id

    Repo.one(query)
  end

  def query_produto(id) do
    query =
      from produto in ProdutoModel,
        where: produto.id == ^id,
        select: produto.id

    Repo.one(query)
  end

  def create_compra(idUsuario, idProduto) do
    usuario = query_usuario(idUsuario)
    produto = query_produto(idProduto)

    insert_compra = %{"id_usuario" => usuario, "id_produto" => produto}

    %CompraModel{}
    |> CompraModel.changeset(insert_compra)
    |> Repo.insert()
  end

  def create_produto(attrs \\ %{}) do
    %ProdutoModel{}
    |> ProdutoModel.changeset(attrs)
    |> Repo.insert()
  end


#dashboard Relatórios

# ________Relatorio total de compras no dia ___________

def total_compras_no_dia do
  query = from( c in CompraModel,
  where: fragment("date(?) = DATE(NOW())", c.inserted_at),
  select: %{
    total: count(c.id)
  }

  )
  Repo.all(query)
end


  # ____Relatorio total de compras na semana___________
  def total_compras_semana do
   query = from(c in CompraModel,
   join: p in ProdutoModel,
   where: fragment("date(?) >= date(current_date - interval '1 week')", c.inserted_at),
   group_by: fragment("date(?)", c.inserted_at),
   select: %{
    total_produtos: count(p.id),
    valor_gasto: sum(p.valor)
    })
   Repo.all(query)

  end

  # ____Relatorio total de compras na semana___________
  def total_compras_mes do
  query = from(c in CompraModel,
   join: p in ProdutoModel,
   where: fragment("date(?) >= date(current_date - interval '1 MONTH')", c.inserted_at),
   group_by: fragment("date(?)", c.inserted_at),
   select: %{
    total_produtos: count(p.id),
    valor_gasto: sum(p.valor)
    })
   Repo.all(query)
  end

#____________Relatorio total de compras clientes______
def total_compras_cliente(id) do
query = from(u in UsuarioModel,
inner_join: c in CompraModel,
on: u.id == c.id_usuario,
inner_join: p in ProdutoModel,
on: p.id == c.id_produto,
where: u.id == ^id and  fragment("date(?) >= date(current_date - interval '1 MONTH')", c.inserted_at),
group_by: fragment("date(?)", c.inserted_at),
select: %{
  total_gasto: sum(p.valor)
}
)
Repo.all(query)
end

#____________Relatorio media de compras clientes de uma semana______
def media_compras_na_semana(id) do
  query = from(
    c in CompraModel,
    where: fragment("date(?) >= date(current_date - interval '1 week')", c.inserted_at)
    and c.id_usuario == ^id,
    select: %{
      media: sum(c.id) / count()
    }

  )
  Repo.all(query)
end

#___________Calcular a porcentagem ________________
def calcular_porcentagem do
  query = from(
  c in CompraModel,
  inner_join: p in ProdutoModel,
  group_by: c.id_produto,
  select: %{
    porcentagem: count(c.id_produto) / count(p.valor) * 100

  }

  )

  Repo.all(query)

end


end
