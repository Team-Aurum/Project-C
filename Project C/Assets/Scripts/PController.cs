using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PController : MonoBehaviour
{
    public EController eController;
    public List<ICharacter> characters;
    public Button attackButton;
    public GameObject testAnim;
    public Image portrait1, portrait2, portrait3, portrait4;
    public GameObject card1, card2, card3, card4;
    public Text health1, health2, health3, health4, energy1, energy2, energy3, energy4;
    public Image HPBar1, HPBar2, HPBar3, HPBar4, EPBar1, EPBar2, EPBar3, EPBar4, BPBar1, BPBar2, BPBar3, BPBar4, OverBar1, OverBar2, OverBar3, OverBar4;
    
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

    // Sets all UI-specific elements as well as setting the variable List<ICharacter> characters
    public void InitPlayers(List<ICharacter> players){
        Debug.Log("Setting Player Data");
        characters = players;
        switch(players.Count){
            case 4:
                portrait4.sprite = characters[3].portrait;
                health4.text = characters[3].currentHP + "/" + characters[3].maxHP;
                energy4.text = characters[3].currentEP + "/" + characters[3].maxEP;
                HPBar4.fillAmount = (float)characters[3].currentHP/characters[3].maxHP;
                EPBar4.fillAmount = (float)characters[3].currentEP/characters[3].maxEP;
                BPBar4.fillAmount = (float)characters[3].currentBP/100;
                OverBar4.fillAmount = (float)(characters[3].currentBP - 100)/100;
                card4.SetActive(true);
                goto case 3;
            case 3:
                portrait3.sprite = characters[2].portrait;
                health3.text = characters[2].currentHP + "/" + characters[2].maxHP;
                energy3.text = characters[2].currentEP + "/" + characters[2].maxEP;
                HPBar3.fillAmount = (float)characters[2].currentHP/characters[2].maxHP;
                EPBar3.fillAmount = (float)characters[2].currentEP/characters[2].maxEP;
                BPBar3.fillAmount = (float)characters[2].currentBP/100;
                OverBar3.fillAmount = (float)(characters[2].currentBP - 100)/100;
                card3.SetActive(true);
                goto case 2;
            case 2:
                portrait2.sprite = characters[1].portrait;
                health2.text = characters[1].currentHP + "/" + characters[1].maxHP;
                energy2.text = characters[1].currentEP + "/" + characters[1].maxEP;
                HPBar2.fillAmount = (float)characters[1].currentHP/characters[1].maxHP;
                EPBar2.fillAmount = (float)characters[1].currentEP/characters[1].maxEP;
                BPBar2.fillAmount = (float)characters[1].currentBP/100;
                OverBar2.fillAmount = (float)(characters[1].currentBP - 100)/100;
                card2.SetActive(true);
                goto case 1;
            case 1:
                portrait1.sprite = characters[0].portrait;
                health1.text = characters[0].currentHP + "/" + characters[0].maxHP;
                energy1.text = characters[0].currentEP + "/" + characters[0].maxEP;
                HPBar1.fillAmount = (float)characters[0].currentHP/characters[0].maxHP;
                EPBar1.fillAmount = (float)characters[0].currentEP/characters[0].maxEP;
                BPBar1.fillAmount = (float)characters[0].currentBP/100;
                OverBar1.fillAmount = (float)(characters[0].currentBP - 100)/100;
                card1.SetActive(true);
                break;
            default:
                break;
        }
        switch(players.Count){
            case 1:
                card1.transform.localPosition = new Vector3(0,-421.6379f,0);
                break;
            case 2:
                card1.transform.localPosition = new Vector3(-100,-421.6379f,0);
                card2.transform.localPosition = new Vector3(100,-421.6379f,0);
                break;
            case 3:
                card1.transform.localPosition = new Vector3(-200,-421.6379f,0);
                card2.transform.localPosition = new Vector3(0,-421.6379f,0);
                card3.transform.localPosition = new Vector3(200,-421.6379f,0);
                break;
            default:
                break;
        }
    }

    public void EnemyDataGrabber(){ //Tester Function, eventually get rid of or potentially just have it print to debug log
        Debug.Log("Grabbing Enemy Data");
        Debug.Log("Enemy 1 (" + eController.characters[0].name + ") is level " + eController.characters[0].level + 
        "\nMax HP: " + eController.characters[0].maxHP +
        "\nMax EP: " + eController.characters[0].maxEP +
        "\nAttack: " + eController.characters[0].attack + 
        "\nMagic: " + eController.characters[0].magic +
        "\nSpeed: " + eController.characters[0].speed +
        "\nDefense: " + eController.characters[0].defense +
        "\nResistance: " + eController.characters[0].resistance +
        "\nResistances Matrix: [" + eController.characters[0].resistances[0] +
        ", " + eController.characters[0].resistances[1] + 
        ", " + eController.characters[0].resistances[2] +
        ", " + eController.characters[0].resistances[3] + "]");
    }

    public void Attack(){

    }
}