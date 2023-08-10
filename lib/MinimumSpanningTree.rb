# Implementação da estrutura de dados Union-Find
class UnionFind
  def initialize(size)
    @parent = Array.new(size, -1)
  end

  def find(x)
    x_root = x
    x_root = @parent[x_root] while @parent[x_root] >= 0
    while x != x_root
      new_parent = @parent[x]
      @parent[x] = x_root
      x = new_parent
    end
    x_root
  end

  def union(x, y)
    x_root = find(x)
    y_root = find(y)
    return if x_root == y_root

    if @parent[x_root] <= @parent[y_root]
      @parent[x_root] += @parent[y_root]
      @parent[y_root] = x_root
    else
      @parent[y_root] += @parent[x_root]
      @parent[x_root] = y_root
    end
  end
end

# Implementação do algoritmo de Kruskal
def kruskal(graph)
  edges = graph.edges.sort_by { |edge| edge[2] }  # Ordenar as arestas pelo peso (custo)
  num_vertices = graph.num_vertices
  mst = []  # Lista para armazenar as arestas da MST

  union_find = UnionFind.new(num_vertices)

  edges.each do |edge|
    u, v, weight = edge
    if union_find.find(u) != union_find.find(v)
      mst << edge
      union_find.union(u, v)
    end
  end

  mst
end

class Graph
  attr_reader :edges, :num_vertices

  def initialize(num_vertices)
    @edges = []
    @num_vertices = num_vertices
  end

  def add_edge(u, v, weight)
    @edges << [u, v, weight]
  end
end

# Criando o grafo de exemplo
graph = Graph.new(6)
graph.add_edge(0, 1, 4)
graph.add_edge(0, 2, 3)
graph.add_edge(1, 2, 1)
graph.add_edge(1, 3, 2)
graph.add_edge(2, 3, 4)
graph.add_edge(3, 4, 2)
graph.add_edge(4, 5, 6)

# Executando o algoritmo de Kruskal
mst = kruskal(graph)

# Exibindo a MST
puts "Minimum Spanning Tree:"
mst.each { |edge| puts "#{edge[0]} -- #{edge[1]} (weight: #{edge[2]})" }