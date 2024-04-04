class No<T> {
  T dado;
  No proximo;

  No(T dado) {
    this.dado = dado;
    this.proximo = null;
  }
}

class ListaEncadeada<T> {
  No<T> cabeca; //head

  void add(T dado) {
    No<T> novoNo = new No<T>(dado);
    if (cabeca == null) {
      cabeca = novoNo;
    } else {
      No fim = cabeca;
      while (fim.proximo != null) {
        fim = fim.proximo;
      }
      fim.proximo = novoNo;
    }
  }

}
