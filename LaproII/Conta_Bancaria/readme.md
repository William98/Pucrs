*** TODO ***
- [x] Transações das contas
- [x] Modelagem das contas
- [X] Polimorfismo
- [X] Usar STL
- [ ] Modelagem do Banco 
- [ ] Listagem das contas
- [ ] Selecionar Conta
- [ ] Menus (Banco e Conta)

---

    // Funcao do menu
    void menuBanco(int &op){
        cout << "===========================" << endl;
        cout << "==     MENU DO BANCO     ==" << endl;
        cout << "===========================" << endl;
        cout << " 1 - Listar contas." << endl;
        cout << " 2 - Impressao do Saldo." << endl;
        cout << " 3 - Selecionar conta." << endl;
        cout << " 9 - Exit" << endl;
        cout << "============================" << endl;
        cout << "OPERACAO: ";
        cin >> op;

    }