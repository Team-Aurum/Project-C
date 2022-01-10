using System.Collections;
using System.Collections.Generic;
using UnityEngine; public class GroundMove : MonoBehaviour
{
    IEnumerator coroutine;
    bool groundCoroutineRunning = false;
    int speed = 30;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.S) && !groundCoroutineRunning){
            coroutine = MoveUpDown(1);
            groundCoroutineRunning = true;
            StartCoroutine(coroutine);
        }
            // transform.Rotate(Vector3.up * speed * Time.deltaTime);
      
        if (Input.GetKeyDown(KeyCode.W) && !groundCoroutineRunning){
            coroutine = MoveUpDown(-1);
            groundCoroutineRunning = true;
            StartCoroutine(coroutine);
        }

        if (Input.GetKey(KeyCode.A) && transform.position.x < 140 )
            transform.Translate(Vector3.up * speed * Time.deltaTime);

        if (Input.GetKey(KeyCode.D) && transform.position.x > -140)
            transform.Translate(-Vector3.up * speed * Time.deltaTime);
    }

    IEnumerator MoveUpDown(int up){
        int count = 0;
        while(count < 50){
            transform.Rotate(up * Vector3.up * speed * Time.deltaTime);
            count++;
            yield return new WaitForSeconds(0.01f);
        }
        groundCoroutineRunning = false;
    }
}
