#include <iostream>
#include <string>
#include <ctime>

using namespace std;

void End() {
	exit(1);
}	

void Algoritm(int P1Rand1, int P1Rand2, int P2Rand1, int P2Rand2, int *HP1, int *HP2, string TipAttack1, string TipAttack2) {

	if (TipAttack1 == TipAttack2 && TipAttack1 == "Physical ") { *HP1 -= P2Rand1; *HP2 -= P1Rand1; }
	else if (TipAttack1 == TipAttack2 && TipAttack1 == "Magic ") { *HP1 -= P2Rand2; *HP2 -= P1Rand2;}
	else if (TipAttack1 == "Magic ") { 
		int Armor_1 = P1Rand1, Armor_2 = P2Rand2, damage_1 = P1Rand1, damage_2 = P1Rand1;
		if (Armor_1 <= P2Rand1)
		{
			damage_2 = P2Rand1 - Armor_1;
		}
		else
		{
			damage_2 = 0;
		}
		if (Armor_2 <= P1Rand2)
		{
			damage_1 = P1Rand2 - Armor_2;
		}
		else
		{
			damage_1 = 0;
		}
		*HP1 -= damage_2; *HP2 -= damage_1;
	}
	
	else if (TipAttack1 == "Physical ") {
		int Armor_1 = P1Rand2, Armor_2 = P2Rand1, damage_1 = P1Rand2, damage_2 = P1Rand2;
		if (Armor_1 <= P2Rand2)
		{
			damage_2 = P2Rand2 - Armor_1;
		}
		else
		{
			damage_2 = 0;
		}
		if (Armor_2 <= P1Rand1)
		{
			damage_1 = P1Rand1 - Armor_2;
		}
		else
		{
			damage_1 = 0;
		}
		*HP1 -= damage_2; *HP2 -= damage_1;
	}


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

void Walks(int *P1Rand1, int *P1Rand2) {

	while (*P1Rand1 == *P1Rand2)
	{

		srand(time(0));
		*P1Rand1 += rand() % 6 + 1; *P1Rand2 += rand() % 6 + 1;
	}

}

void PlayerVsPlayer(string *NamePlayer_1, string *NamePlayer_2, int *HP1, int *HP2) {
	while (*HP1 > 0 && *HP2 > 0) {
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
		P1Rand1 = rand() % 6 + 1; P1Rand2 = rand() % 6 + 1;
		if (P1Rand1 == P1Rand2) { cout << endl << endl << " Walks!!! " << P1Rand1 << " : " << P1Rand2 << endl << endl; Walks(&P1Rand1, &P1Rand2); cout << endl << endl << " Walks!!! " << P1Rand1 << " : " << P1Rand2 << endl << endl;
		}
		if (TipAttack1 == "Physical ") { cout << "Attack with force: " << P1Rand1 << endl << "Protection: " << P1Rand2 << endl << endl; }
		else { cout << "Attack with force: " << P1Rand2 << endl << "Protection: " << P1Rand1 << endl; }
		system("pause");


		cout << endl << "player " << Pl2 << " walks (1 cube): ";
		P2Rand1 = rand() % 6 + 1;
		if (P2Rand1 == 1 || P2Rand1 == 3 || P2Rand1 == 5) { TipAttack2 = "Magic "; }
		else { TipAttack2 = "Physical "; }
		cout << "Your tip attack: " << TipAttack2 << endl;
		cout << "player " << Pl2 << " walks (2 cube): ";
		P2Rand1 = rand() % 6 + 1; P2Rand2 = rand() % 6 + 1;
		if (P2Rand1 == P2Rand2) { cout << endl << endl << " Walks!!! " << P2Rand1 << " : " << P2Rand2 << endl << endl; Walks(&P2Rand1, &P2Rand2); cout << endl << endl << " Walks!!! " << P2Rand1 << " : " << P2Rand2 << endl << endl;
		}
		if (TipAttack2 == "Physical ") { cout << "Attack with force: " << P2Rand1 << endl << "Protection: " << P2Rand2 << endl; }
		else { cout << "Attack with force: " << P2Rand2 << endl << "Protection: " << P2Rand1 << endl; }
		Algoritm(P1Rand1, P1Rand2, P2Rand1, P2Rand2, HP1, HP2, TipAttack1, TipAttack2);
		cout << endl << "HP " << *NamePlayer_1 << " = " << *HP1 << endl;
		cout << endl << "HP " << *NamePlayer_2 << " = " << *HP2 << endl;
		system("pause");
	}
}


int main(int argc, char* argv[]) {

	setlocale(LC_ALL, "Russian");
	int HP = 30, players = 0, HP1, HP2;
	string NamePlayer_1 = "P1", NamePlayer_2 = "P2";
	setting(&players, &HP, &NamePlayer_1, &NamePlayer_2);               // Настрока
	HP1 = HP, HP2 = HP;
	PlayerVsPlayer(&NamePlayer_1, &NamePlayer_2, &HP1, &HP2);
	if (HP1 <= 0 && HP2 <= 0) { cout << "Huchia "; }
	else if (HP1 <= 0) { cout << "Player " << NamePlayer_2 << " Win!!!"; }
	else if (HP2 <= 0) { cout << "Player " << NamePlayer_1 << " Win!!!"; }
	system("pause");
	return 0;

}

