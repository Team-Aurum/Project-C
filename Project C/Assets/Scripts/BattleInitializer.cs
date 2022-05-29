using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BattleInitializer : MonoBehaviour
{
    public PController pController;
    public EController eController;

    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("BattleInitializer initialized");

        List<ICharacter> tempPlayers = new List<ICharacter>();
        List<ICharacter> tempEnemies = new List<ICharacter>();
        //The below is all test code
        tempPlayers.Add(new Ciaran(20, 100, 100));
        // tempPlayers.Add(new Ciaran(20, 100, 100));
        // tempPlayers.Add(new Ciaran(20, 100, 100));
        // tempPlayers.Add(new Ciaran(20, 100, 100));
        tempEnemies.Add(new Ciaran(20, 100, 100));
        pController.InitPlayers(tempPlayers);
        eController.InitEnemies(tempEnemies);
    }

    // Update is called once per frame
    void Update()
    {

    }
}
