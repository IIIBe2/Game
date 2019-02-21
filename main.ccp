#include <iostream>
#include <string>
#include <ctime>

using namespace std;

// Суть игры в том , что кидаются 3 кубика: 1 определяет тип атаки 
//(При выподаниии 1, 3, 5 физическая атака - и маг. защита , при 2, 4, 6 обратная ситуация - маг. атака и физ защита),
//2 кубик физическая атака/защита  (выпавшее число определяет силу элемента),
//3 кубик магическая атака/защита (выпавшее число определяет силу элемента)
//Ходят игроки по ичереди проигрывает тот у кого первым опустится показатель жизней до "0"
//При выпадении одинкаовых значений на 2 и 3 кубике делается повторный бросок до тех пор пока не выпадут разные значения,
//а все выброшенные числа складываются в силу элемента

void End() {
	exit(1);
}	

void Algoritm(int P1Rand1, int P1Rand2, int P2Rand1, int P2Rand2, int *HP1, int *HP2, string TipAttack1, string TipAttack2) {

	int Attack1, Attack2;
	if (TipAttack1 == TipAttack2 && TipAttack1 == "Physical ") { *HP1 -= P2Rand1; *HP2 -= P1Rand1; }
	else if (TipAttack1 == TipAttack2 && TipAttack1 == "Magic ") { *HP1 -= P2Rand2; *HP2 -= P1Rand2;}
	else if (TipAttack1 == "Magic ") {}
	


}

void setting(int *players, int *HP, string *NamePlayer_1, string *NamePlayer_2) {                    // Меню настроки параметров игры
	string Vote;
	cout << "Standart setting: " << endl << "HP: 30   Name player #1 => P1   Name player #2 => P2" << endl;
	printf("Если хотите изменить стандартные настроки нажмите y => ");
	cin >> Vote;
	if (Vote == "y") {

		cout << "Select number of players, enter 1 or 2 or 0: " << endl;
		cin >> *players;
		if (*players == 0) { End(); }
		cout << "Enter name player #1: " << endl;
		cin >> *NamePlayer_1;
		cout << "Enter name player #2: " << endl;
		cin >> *NamePlayer_2;
		printf("Enter HP: ");
		cin >> *HP;
	}
	else
	{
		printf("Вы отказались от изменения настроек ");
		system("cls");
	}
}

void PlayerPC() {

}

void Walks() {}

void PlayerVsPlayer(string *NamePlayer_1, string *NamePlayer_2, int *HP1, int *HP2) {
	int goes;
	string Pl1, Pl2, TipAttack1, TipAttack2;
	int P1Rand1, P1Rand2, P2Rand1, P2Rand2;
	srand(time(0));
	goes = rand() % 2 + 1;
	if (goes == 1) { Pl1 = *NamePlayer_1; Pl2 = *NamePlayer_2; }
	else { Pl2 = *NamePlayer_1; Pl1 = *NamePlayer_2; }
	cout << "player " << Pl1 << " walks (1 cube): ";
	P1Rand1 = rand() % 6 + 1;
	if (P1Rand1 == 1 || P1Rand1 == 3 || P1Rand1 == 5) { TipAttack1 = "Magic "; }
	else { TipAttack1 = "Physical "; }
	cout << "Your tip attack: " << TipAttack1 << endl;
	cout << "player " << Pl1 << " walks (2 cube): ";
	P1Rand1 = rand() % 6 + 1;
	P1Rand2 = rand() % 6 + 1;
	if (P1Rand1 == P1Rand2) { Walks(); }              //доделать 
	if (TipAttack1 == "Physical ") { cout << "Attack with force: " << P1Rand1 << endl << "Protection: " << P1Rand2 << endl << endl; }
	else { cout << "Attack with force: " << P1Rand2 << endl << "Protection: " << P1Rand1 << endl; }
	system("pause");
	cout << endl << "player " << Pl2 << " walks (1 cube): ";
	P2Rand1 = rand() % 6 + 1;
	if (P2Rand1 == 1 || P2Rand1 == 3 || P2Rand1 == 5) { TipAttack2 = "Magic "; }
	else { TipAttack2 = "Physical "; }
	cout << "Your tip attack: " << TipAttack2 << endl;
	cout << "player " << Pl1 << " walks (2 cube): ";
	P2Rand1 = rand() % 6 + 1;
	P2Rand2 = rand() % 6 + 1;
	if (P2Rand1 == P2Rand2) { Walks(); }              //доделать 
	if (TipAttack2 == "Physical ") { cout << "Attack with force: " << P2Rand1 << endl << "Protection: " << P2Rand2 << endl; }
	else { cout << "Attack with force: " << P2Rand2 << endl << "Protection: " << P2Rand1 << endl; }
	Algoritm(P1Rand1, P1Rand2, P2Rand1, P2Rand2, HP1, HP2, TipAttack1, TipAttack2);
}


int main(int argc, char* argv[]) {

	setlocale(LC_ALL, "Russian");
	int HP = 30, players = 0, HP1, HP2;
	string NamePlayer_1 = "P1", NamePlayer_2 = "P2";
	setting(&players, &HP, &NamePlayer_1, &NamePlayer_2);               // Настрока                   //cout << HP << endl << NamePlayer_1 << endl << NamePlayer_2 ;
	HP1 = HP, HP2 = HP;
	PlayerVsPlayer(&NamePlayer_1, &NamePlayer_2, &HP1, &HP2);

	





	system("pause");
	return 0;
}
