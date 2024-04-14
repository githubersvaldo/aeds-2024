class ListaDinamica<T> {

  private Object[] elementos; // Array privado para armazenar os elementos da lista
  private int tamanho; // Tamanho atual da lista

  // Construtor sem capacidade inicial (capacidade padrão de 10)
  public ListaDinamica() {
    elementos = new Object[10];
    tamanho = 0;
  }

  // Adiciona um novo elemento à lista
  public void adicionar(T elemento) {
    if (tamanho == elementos.length) expandirCapacidade(); // Dobra a capacidade da lista se necessário
    
    elementos[tamanho] = (T) elemento; // Cast necessário
    tamanho++;
  }

  // Remove um elemento da lista por índice
  public void removerPorIndice(int indice) {
    if (indice < 0 || indice >= tamanho) throw new IndexOutOfBoundsException("Índice inválido: " + indice);
    
    System.arraycopy(elementos, indice + 1, elementos, indice, tamanho - indice - 1);
    elementos[tamanho - 1] = null; // Garante que a última posição do array seja null
    tamanho--;
  }

  // Obtém um elemento da lista por índice
  public T obterPorIndice(int indice) {
    if (indice < 0 || indice >= tamanho) throw new IndexOutOfBoundsException("Índice inválido: " + indice);
    
    return (T) elementos[indice]; // Cast necessário
  }

  // Define um valor para um elemento da lista por índice
  public void definirValor(int indice, T elemento) {
    if (indice < 0 || indice >= tamanho) throw new IndexOutOfBoundsException("Índice inválido: " + indice);
    
    elementos[indice] = (T) elemento; // Cast necessário
  }

  // Retorna o tamanho da lista
  public int obterTamanho() {
    return tamanho;
  }

  // Verifica se a lista está vazia
  public boolean estaVazia() {
    return tamanho == 0;
  }

  // Expande a capacidade da lista dobrando seu tamanho atual
  private void expandirCapacidade() {
    Object[] novosElementos = new Object[elementos.length * 2];
    System.arraycopy(elementos, 0, novosElementos, 0, elementos.length);
    elementos = novosElementos;
  }
}
