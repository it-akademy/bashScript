#include <iostream>
#include <stdio.h>
#include <windows.h>

using namespace std;

string phrase;
void affichage(string);
void codec(string);
int* force;
int main()
{
    getline(cin,phrase); //phrase
    int taille = phrase.size();
    int order[taille];
    force = &order[0];  //pointeur sur la phrase
    codec(phrase);      //crée l'ordre d'apparition des lettres
    for(int nbr=0;nbr < sizeof(order)/4;nbr++)
    {cout << order[nbr] << "-";}
    affichage(phrase);  //fait l'affichage (style matrix)
    cout << endl;
    //getchar();
    return 0;
}

/*créer un programme qui, quelque soit la lettre
affiche des chiffres au hasard, puis affiche aléatoirement
la chaîne rentrée*/

void codec(string phr)
{
    int ey;
    for(int nbr = 0; nbr < phr.size(); nbr ++) //choisis aléatoirement l'ordre
    {
        ey = rand()%phr.size();
        for(int nbr2 = 0; nbr2 < phr.size(); nbr2 ++) //teste l'unicité de chaque lettre
        {
            if(ey == *(force+nbr2)) //si un ordre est en doublon, le change et reteste
            {
                ey = rand()%phr.size();
                nbr2 = -1;
            }
        }
        /*for(int test = 0; test < nbr; test++)
        {cout << *(force+test) << "-";}
        cout << endl;*/
        *(force+nbr) = ey; //assigne les lettres
        //cout << *(force+nbr) << "-";
    }
    /* faire une fonction qui choisit l'ordre d'aff des lettres
    puis savoir quand les aff*/
    //return renv;
}

void affichage(string code)
{
    int precis = 0,v2 = 0; //variables de temps
    int compte = code.size();
    string cryptage;
    int nbr, nbr2, lettre = 0, boucle = 0;
    while(compte > 0)
    {
        for(int damn=0;damn<5;damn ++) //damn = 1 seconde
        {
            for(nbr=0;nbr<10;nbr++) //nbr = 0,1 seconde     v2 = 0,5 seconde    precis = 5 secondes
            {
                for(nbr2 = 0; nbr2 < code.size(); nbr2 ++)
                {
                    ////check les lettres et faire le cryptage
                    /*if(nbr2 > lettre || nbr2 == lettre && lettre == 0 /*&& precis < 501)
                    {*/
                        //mettre chaque lettre random
                        cryptage[nbr2] = (char)(65 + rand()%57);
                        /*while(cryptage[nbr2] == cryptage[nbr2])
                        {cryptage[nbr2] = rand()%9 + 1;}*/
                        for(int nbr3 = 0; nbr3 < lettre+1; nbr3++)
                        {
                            for(int nbr5 = 0; nbr5 < code.size(); nbr5 ++)
                            {
                                if(nbr5 == *(force+nbr3) && precis > 200)
                                {
                                    cryptage[nbr5] = code[nbr5];
                                }
                            }
                        }
                    /*}*/
                    if(v2 >= 20)                                 //0,5 secondes
                    {

                        if(nbr2 == *(force+lettre) && precis > 200)
                        {
                            //changer la lettre donnée
                            cryptage[nbr2] = code[nbr2];
                            v2 = 0;
                            lettre ++;
                            compte --;
                        }
                    }
                }
                //system("cls");
                for(int nbr4 = 0; nbr4 < code.size(); nbr4 ++)
                {
                    cout << cryptage[nbr4]; //affichage (problème)
                }
                cout << endl;
                Sleep(10);
                //timer 0.1 seconde
                precis ++;
                v2++;
            }
        }
    }
}
