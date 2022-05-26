using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PController : MonoBehaviour
{
    public EController eController;
    public List<ICharacter> characters;
    public Button attackButton;
    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("PController initialized");
        attackButton.onClick.AddListener(EnemyDataGrabber);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void InitPlayers(List<ICharacter> players){
        Debug.Log("Setting Player Data");
        characters = players;
    }

    public void EnemyDataGrabber(){
        Debug.Log("Grabbing Enemy Data");
        int attack = eController.characters[0].attack;
        Debug.Log("Enemy in first position is level " + eController.characters[0].level + 
        " and has an attack value of: " + attack);
    }
}
