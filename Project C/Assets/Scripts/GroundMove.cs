using System.Collections;
using System.Collections.Generic;
using UnityEngine; public class GroundMove : MonoBehaviour
{
    int speed = 30;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKey(KeyCode.S))
            transform.Rotate(Vector3.up * speed * Time.deltaTime);
      
        if (Input.GetKey(KeyCode.W))
            transform.Rotate(-Vector3.up * speed * Time.deltaTime);

        if (Input.GetKey(KeyCode.A) && transform.position.x < 140 )
            transform.Translate(Vector3.up * speed * Time.deltaTime);

        if (Input.GetKey(KeyCode.D) && transform.position.x > -140)
            transform.Translate(-Vector3.up * speed * Time.deltaTime);
    }
}
