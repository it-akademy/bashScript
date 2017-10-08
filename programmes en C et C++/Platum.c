#include <stdio.h>
#include <stdlib.h>

int b, bb, y; //axe y
int c, cc, x; //axe x
int rx, ry, resx, resy; //var de reset
int compt, go, para; //var divers
int points = 0, reset = 0; //var d'interactions
int a[100][100]; //tableau
int tr = 1; //aucune idée de son utilisation
int haut = 72, bas = 80; //valeur int des flèches haut et bas
int gauche = 75, droite = 77; //même chose gauche et droite
char dir; //valeur char de la direction (transformée en int)
char yey; //prend la valeur de la direction au moment du getch
void verif();
void finder();
void aff();
void aide();
int main()
{
    while(1)
    {
    go = 0;
    system("cls");
    printf("__________   __               __ \n");
    printf("\\______   \\ |  |   _____    _/  |_   __ __    _____ \n");
    printf(" |     ___/ |  |   \\__  \\   \\   __\\ |  |  \\  /     \\ \n");
    printf(" |    |     |  |__  / __ \\_  |  |   |  |  / |  Y Y  \\ \n");
    printf(" |____|     |____/ (____  /  |__|   |____/  |__|_|  / \n");
    printf("                        \\/                        \\/ \n\n");
    printf("Entrez la taille X et Y du tableau\n");
    scanf("%d %d", &cc, &bb);
    for(b=0;b<bb;b++)
        {
        for(c=0;c<cc;c++)
        {
            a[b][c] = 0;
        }
        }
    x = rand()%cc; y = rand()%bb;
    a[y][x] = 1;
    rx = cc+1; ry = bb+1;
    aide();
    while (1)
    {
        verif();
        finder();
        aff();
            if(go == 1)
            {
                //system("cls");
                printf("game over\nscore : %d \npress enter\n",points);
                points = 0;
                reset = 0;
                while(yey != 13)
                {yey = getch();
                dir = yey;}
                break;
            }
            yey = getch();
            dir = yey;
            if (dir == 72 && y > 0 && a[y-1][x] != 2)
            {
                //printf("bleuh");
                a[y][x] = 2;
                y = y-1;
            }
            else if (dir == 80 && y < bb-1 && a[y+1][x] != 2)
            {
                a[y][x] = 2;
                y = y+1;
            }
            else if (dir == 75 && x > 0 && a[y][x-1] != 2)
            {
                a[y][x] = 2;
                x = x-1;
            }
            else if (dir == 77 && x < cc-1 && a[y][x+1] != 2)
            {
                a[y][x] = 2;
                x = x+1;
            }
            if (x == rx && y == ry)
            {
                points = points+1; reset = reset+1;
                rx = cc+1; ry = bb+1;
            }
            if (reset == (cc+bb)/4 || dir == 114)
            {
                for(b=0;b<bb;b++)
                {
                    for(c=0;c<cc;c++)
                    {
                        a[b][c] = 0;
                    }
                }
                reset = 0;
                if(dir == 114)
                {
                    points = 0;
                }
            }
            a[y][x] = 1;
            //printf("score : %d %d \n",points,dir);
    }
    }
}

void verif()
{
    resx = 0; resy = 0;
    while((rx > cc-1 || ry > bb-1 || a[ry][rx] == 2 || a[ry][rx] == 1) && go == 0)
        { printf("%d %d \n",resx,resy);
            rx = rand()%cc; ry = rand()%bb;
            if(rx == resx)
            {
            if(ry == resy)
            {
                resy = resy+1;
            }
            if(resy >= bb)
            {
                resx = resx+1;
                resy == 0;
            }
            }
            if(resx >= cc && resy >= bb)
            {
                go = 1;

           }
        }
        if((y == bb-1 || a[y+1][x] == 2) && (y == 0 || a[y-1][x] == 2) && (x == cc-1 || a[y][x+1] == 2) && (cc == 0 || a[y][x-1] == 2))
        {
                go = 1;
        }

}

void finder()
{//faire remplir les cases par un chiffre, et si case à côté chiffre libre, remplir chiffre, jusqu'à toucher 0
    if(a[y+1][x] == 0 && y < bb-1)
    {a[y+1][x] = 5;}
    if(a[y-1][x] == 0 && y > 0)
    {a[y-1][x] = 5;}
    if(a[y][x+1] == 0 && x < cc-1)
    {a[y][x+1] = 5;}
    if(a[y][x-1] == 0 && x > 0)
    {a[y][x-1] = 5;}
    while(a[ry][rx] != 5)
    {
        //aff();
        para = 0;
        for(b=0;b<bb;b++)
        {
            for(c=0;c<cc;c++)
            {
                if (a[b][c] == 5)
                {
                    if(a[b+1][c] == 0 && b < bb-1)  {a[b+1][c] = 5; para = 1;}
                    if(a[b-1][c] == 0 && b > 0)     {a[b-1][c] = 5; para = 1;}
                    if(a[b][c+1] == 0 && c < cc-1)  {a[b][c+1] = 5; para = 1;}
                    if(a[b][c-1] == 0 && c > 0)     {a[b][c-1] = 5; para = 1;}
                }
            }
        }
        if(para == 0)
            {go = 1; a[ry][rx] = 5;}
    }
    for(b=0;b<bb;b++)
        {
            for(c=0;c<cc;c++)
            {
                if (a[b][c] == 5)
                {
                    a[b][c] = 0;
                }
            }
        }
}

void aff()
{
    system("cls");
    for(b=0;b<bb;b++)
    {
        for(c=0;c<cc;c++)
        {
            if (a[b][c] == 2)
            {
                printf("   ");
            }
            else if(b == ry && c == rx)
            {
                printf("[0]");
            }
            else if(a[b][c] == 1)
            {
                printf("[1]");
            }
            else if(a[b][c] == 5)
            {
                printf("[5]");
            }
            else
            {
                printf("[ ]");
            }
        }
        printf("\n");
    }
}

void aide()
{
    system("cls");
    printf("utilisez les fl%cches pour vous d%cplacer\n",138,130);
    printf("r%ccoltez le plus de pi%cces possible\n",130,138);
    printf("les cases disparaissent derri%cre vous\n",138);
    printf("attention %c ne pas vous pi%cger",133,130);
    getch();
}
