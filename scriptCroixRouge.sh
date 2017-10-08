#! /bin/bash
function menu() {

  select test in "Retourner au menu" "Quitter";
  do
    case $test in
      "Retourner au menu" ) bash scriptCroixRouge.sh;;
      "Quitter" ) echo "Merci d'avoir utilisé notre application. A bientôt";exit 0;;
    esac
  done
}

echo "——-$(tput setaf 1)††††$(tput sgr 0)——-
——-$(tput setaf 1)††††$(tput sgr 0)——-
$(tput setaf 1)††††††††††
††††††††††$(tput sgr 0)
——-$(tput setaf 1)††††$(tput sgr 0)——-
——-$(tput setaf 1)††††$(tput sgr 0)——-
"


echo "Bienvenue sur l'application officielle de la $(tput setaf 1)Croix-Rouge Française$(tput sgr 0).";
echo "Elle vous permet de découvrir les premiers gestes à effectuer en cas de blessure."

echo "Que voulez-vous faire?"

#Déterminer le choix de l'utilisateur
select menu in "Choisir le type de blessure" "Quitter";
do
  case $menu in
    "Choisir le type de blessure" ) break;;
    #Si l'utilisateur souhaite quitter l'application.
    "Quitter" ) echo "Merci d'avoir utilisé notre application. A bientôt";exit 0;;
  esac
done

echo "Nous allons vous poser quelques questions pour déterminer la nature de la blessure et vous conseiller les premiers soins à prodiguer.";
echo "/!\ Avant toute chose, veuillez à bien vous laver les mains à l'eau et au savon /!\\"

#Demande à l'utilisateur de sélectionner le type de blessure.
choice="";
select typeBlessure in "Plaie" "Hématome" "Piqûre" "Fracture" "Rhume" "Retourner au menu";
do
  case $typeBlessure in
    Plaie ) choice="Plaie";break;;
    Hématome ) choice="Hématome";break;;
    Piqûre ) choice="Piqûre";break;;
    Fracture ) choice="Fracture";break;;
    Rhume ) choice="Rhume";break;;
    "Retourner au menu" ) bash scriptCroixRouge.sh;;
  esac
done

#Si l'utilisateur choisi une plaie.
if [[ "$choice" == "Rhume" ]]; then echo "Serieux ? C'est les urgences pas la foire à la saucisse ici ! Dégage ! ";
  #statements
  sleep 1
  echo "..."
  sleep 1
  echo "Connard !"
  printf "\n"
  printf "\n"
  menu
elif [ "$choice" == "Plaie" ]
then
  echo "La peau protège l'ensemble du corps contre les agressions extérieures. C'est pourquoi toute plaie cutanée nécessite des soins rigoureux."
  echo "L'objectif est d'arrêter les saignements, éviter les infections et favoriser une bonne cicatrisation."
  echo "Vous pouvez soigner vous-même plusieurs types de plaies:"
  select typeBlessure in "Eraflure" "Coupure" "Brûlure" "Retourner au menu";
  do
    case $typeBlessure in
      Eraflure ) choice="Eraflure";break;;
      Coupure ) choice="Coupure";break;;
      Brûlure ) choice="Brûlure";break;;
      "Retourner au menu" ) bash scriptCroixRouge.sh;;
    esac
  done
  #L'utilisateur sélectionne l'éraflure.
  if [ "$choice" == "Eraflure" ]
  then
    printf "\n"
    echo "Une éraflure saigne peu et guérissent le plus souvent sans séquelle."
    printf "\n"
    echo "-----------------------------"
    echo "Comment soigner une éraflure?"
    echo "-----------------------------"
    printf "\n"
    echo "Il suffit de désinfecter la zone touchée avec une compresse et un antiseptique."
    printf "\n"
    menu
  fi
  #L'utilisateur sélectionne une coupure.
  if [ "$choice" == "Coupure" ]
  then
    printf "\n"
    echo "Dans le cas d'un coupure simple, peu profonde et peu étendue, vous pouvez la traiter directement à domicile."
    printf "\n"
    echo "-----------------------------"
    echo "Comment soigner une coupure?"
    echo "-----------------------------"
    printf "\n"
    echo "1. Pour ôter le sang et les salissures, passez la plaie sous un filet d’eau à température ambiante."
    echo "2. Désinfectez la plaie du centre vers l’extérieur, avec une compresse et un antiseptique."
    echo "3. Recouvrez la plaie d’un pansement adhésif prêt à l’emploi. Cela favorise la cicatrisation en maintenant la peau humide."
    printf "\n"
    echo "En cas d'une coupure profonde et/ou étendue, veuillez consulter les urgences au plus vite."
    printf "\n"
    menu
  fi
  #L'utilisateur sélectionne une brûlure.
  if [ "$choice" == "Brûlure" ]
  then
    printf "\n"
    echo "Dans le cas d'un coupure simple, peu profonde et peu étendue, vous pouvez la traiter directement à domicile."
    printf "\n"
    echo "-----------------------------"
    echo "Comment soigner une coupure?"
    echo "-----------------------------"
    printf "\n"
    echo "1. Pour ôter le sang et les salissures, passez la plaie sous un filet d’eau à température ambiante."
    echo "2. Désinfectez la plaie du centre vers l’extérieur, avec une compresse et un antiseptique."
    echo "3. Recouvrez la plaie d’un pansement adhésif prêt à l’emploi. Cela favorise la cicatrisation en maintenant la peau humide."
    printf "\n"
    echo "En cas d'une coupure profonde et/ou étendue, veuillez consulter les urgences au plus vite."
    printf "\n"
    menu
  fi

elif [ "$choice" == "Hématome" ]
then
  echo "Un hématome est un épanchement de sang dans les tissus superficiels ou profonds (peau, organe, muscle) consécutif à la rupture d'un ou de plusieurs vaisseaux sanguins."
  echo "Il existe deux grandes familles d'hématomes:"
  select typeBlessure in "Cutané" "Sous cutané" "Retourner au menu";
  do
    case $typeBlessure in
      "Cutané" ) choice="Cutané";break;;
      "Sous cutané" ) choice="Sous cutané";break;;
      "Retourner au menu" ) bash scriptCroixRouge.sh;;
    esac
  done
  if [ "$choice" == "Cutané" ]
  then
    printf "\n"
    echo "-----------------------------"
    echo "Comment soigner un hématome cutané?"
    echo "-----------------------------"
    printf "\n"
    echo "La plupart des hématomes cutanés sont bénins et guérissent spontanément."
    printf "\n"
    echo "/!\ Si votre hématome est très volumineux, consultez un médecin au plus vite. /!\\"
    menu
  fi
  if [ "$choice" == "Sous cutané" ]
  then
    printf "\n"
    echo "-----------------------------"
    echo "Comment soigner un hématome sous-cutané?"
    echo "-----------------------------"
    printf "\n"
    echo "Pour le traiter, il suffit, juste après le choc, de passer la zone touchée sous l'eau froide ou d'appliquer dessus un linge froid et de la frotter avec de la pommade à l' arnica ou à l'héparine."
    menu
  fi
elif [ "$choice" == "Piqûre" ];
  then
   echo "Dans le cas d'une piqûre ou de morsure, on observe une réaction cutanée plus ou moins sévère. En fonction des symptômes, il peut être nécessaire de contacter les secours"
   select typeSting in "Piqûre" "Morsure" "Retourner au menu";
   do
     case $typeSting in
       Piqûre ) choice="Piqûre";break;;
       Morsure ) choice="Morsure";break;;
       "Retourner au menu" ) bash scriptCroixRouge.sh;;
     esac
   done
   if [ "$choice" == "Piqûre" ]
   then
     printf "\n"
     echo "-----------------------------"
     echo "Comment traiter une piqûre d'insecte (abeille, guêpe, frelon...)"
     echo "-----------------------------"
     printf "\n"
     echo "Si vous notez l'apparition d'un des symptômes suivants, il est impératif de contacter le samu au 15 ou au 112"
     echo "Difficulté respiratoire"
     echo "Gonflement des muqueuses ou des yeux"
     echo "Etourdissements"
     echo "Malaises et nausées"
     echo "Fièvres & frissons"
     printf "\n"
     menu
   else
     printf "\n"
     echo "-----------------------------"
     echo "Comment traiter une morsure de serpent"
     echo "-----------------------------"
     printf "\n"
     echo "Dans le cadre d'une morsure de serpent, tachez de garder votre calme et d'appeler immédiatement les urgences (15 ou 112)"
     echo "Minimisez vos déplacements et vos mouvements car ceux ci favorisent la diffusion du venin"
     echo "/!\ Ne faites jamais un garrot en amont de la zone mordue, et ne tentez pas de sucer ou d'aspirer la plaie/!\\"
     menu

   fi
elif [ "$choice" == "Fracture" ]
  then
  printf "\n"
  echo "-----------------------------"
  echo "Comment traiter une fracture "
  echo "-----------------------------"
  printf "\n"
  echo "Commencez par appliquer ces principes:"
  echo "Ne pas bouger le membre blessé"
  echo "Appliquer de la glace sur le membre"
  echo "Immobiliser le membre"
  echo "Maintenir le membre en position surélevée"
   #statements
  echo "Quel est votre membre fracturé ?"
    fracture_response=""
    select fractures in 'Jambes' 'Bras' 'Cou' 'Crâne' 'Epaules' 'Pieds' 'Mains' 'Poignets'; do
      case $fractures in
        "Jambes" ) fracture_response="Jambes";break;;
        "Bras" ) fracture_response="Bras";break;;
        "Cou" ) fracture_response="Cou";break;;
        "Tête" ) fracture_response="Tête";break;;
        "Epaules" ) fracture_response="Epaules";break;;
        "Pieds" ) fracture_response="Pieds";break;;
        "Mains" ) fracture_response="Mains";break;;
        "Poignets" ) fracture_response="Poignets";break;;
      esac
    done
    if [ "$fracture_response" == "Cou" ]
      then
      echo "Bravo vous êtes probablement mort.";
    elif [[ "$fracture_response" == "Jambes" ]]
      then
      printf "\n"
      echo "-----------------------------"
      echo "Fracture de la jambe "
      echo "-----------------------------"
      printf "\n"
      echo "Placez une attelle temporaire (support rigide comme une planchette de bois) de chaque côté de la jambe fracturée et maintenir l’ensemble avec du tissu noué."
      echo "Ne pas serrer trop fort afin d’éviter de créer un effet garrot et d’empêcher la bonne circulation sanguine."
      menu
    elif [[ "$fracture_response" == "Bras" ]]
      then
      printf "\n"
      echo "-----------------------------"
      echo "Fracture du bras "
      echo "-----------------------------"
      printf "\n"
      echo "Placez le bras fracturé contre la poitrine et l’entourer en écharpe, avec un tissu noué derrière le cou."
      menu
    elif [[ "$fracture_response" == "Crâne" ]]
      then
      printf "\n"
      echo "-----------------------------"
      echo "Fracture du crâne "
      echo "-----------------------------"
      printf "\n"
      echo "Foncez à l'hôpital abruti !"
      menu
    elif [[ "$fracture_response" == "Epaules" ]]
      then
      printf "\n"
      echo "-----------------------------"
      echo "Fracture des épaules "
      echo "-----------------------------"
      printf "\n"
      echo "Si vous passez par un traitement à l'arrache, procédez comme suis, mais soyez informez que des déformations de l'os peuventt intervenir:"
      echo "Portez une attelle d'immobilisation coude au corps, ou par des anneaux qui attirent l'extrémité distale de la clavicule vers l'arrière que l'on porte pour une période de trois à quatre semaines."
      echo "Sinon allez au urgences directement."
      menu
    elif [[ "$fracture_response" == "Pieds" ]]
      then
      printf "\n"
      echo "-----------------------------"
      echo "Fracture des pieds "
      echo "-----------------------------"
      printf "\n"
      echo "Cette fracture est compliquée à gérer et vous devrez vous rendre à l'hopital pour guérir"
      echo "Néanmoins voici ce que vous pouvez faire:"
      echo "Bouger au minimum le pied et le surélever, trouvez quelque chose pour coller vos morceaux de iep."
      menu
    elif [[ "$fracture_response" == "Mains" ]]
      then
      printf "\n"
      echo "-----------------------------"
      echo "Fracture des mains "
      echo "-----------------------------"
      printf "\n"
      echo "Rendez vous à l'hôpital, vous serez alors plâtré, le processus de guréison prendra environ un mois"
      menu
    elif [[ "$fracture_response" == "Poignets" ]]
      then
      printf "\n"
      echo "-----------------------------"
      echo "Fracture du poignets "
      echo "-----------------------------"
      printf "\n"
      echo "Sensiblement pareil que pour la main, plâtrez vous et ne bougez pas votre membre."
      menu
    fi

fi
