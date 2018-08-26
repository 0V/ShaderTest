using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TopologyController : MonoBehaviour
{
    [SerializeField]
    private MeshTopology topology;

    void Start()
    {
        MeshFilter meshFilter = GetComponent<MeshFilter>();
        meshFilter.mesh.SetIndices(meshFilter.mesh.GetIndices(0), topology, 0);
    }
}
