//player yelling loud sounds 

_list=(position Event_TempestDevice) nearObjects ["O_Soldier_F", 500];


_Positions=[];

{
	_positions pushback [getpos _x,getdir _x];

}foreach _list;


copyToClipboard (str _positions);
hint format ["%1",_positions];

//Opfor
[[[2753.74,1692.24,0.00170898],200.022],[[2758.08,1692.49,0.00154114],166.433],[[2758.83,1691.78,0.00183105],168.312],[[2766.31,1690.88,-0.014328],157.388],[[2773.36,1713.04,0.00169373],109.737],[[2761.03,1742.63,0.00143433],0],[[2764.18,1758.35,0.00143433],79.0682],[[2753.45,1748.39,0.00157166],234.012],[[2765.27,1736.16,0.00143433],55.9941],[[2774.45,1771.27,0.00126648],349.787],[[2794.52,1749.79,0.00151062],28.7758],[[2796.38,1744.18,0.00143433],141.27],[[2785.9,1741.49,0.00125122],264.938],[[2816.94,1749.54,0.00137329],102.048],[[2828.43,1747.3,0.00164795],75.7299],[[2836.71,1758.76,0.00189209],114.011],[[2823.27,1761.6,0.00224304],118.613],[[2873.56,1747.51,0.00166321],90.4259],[[2866.69,1747.51,0.00170898],90.1859],[[2859.81,1747.52,0.00164795],90.3546],[[2853.16,1747.52,0.00170898],90.3704],[[2903.25,1726.51,0.00134277],119.185],[[2909.68,1727.51,0.00210571],148.341],[[2901.42,1725.48,0.00141907],155.222],[[2898.36,1729.66,0.000762939],268.229],[[2889.42,1730.41,0.00234985],161.994],[[2904.23,1746,0.0015564],89.0718],[[2884.74,1747.71,0.00169373],96.0835],[[2924.04,1746.52,0.00158691],88.7559],[[3038.85,1727.95,0.00176239],181.545],[[3064.18,1724.89,0.00167847],128.408],[[3043.38,1728.68,0.00172424],148.174],[[3062.93,1734.61,0.00163269],155.576],[[3045.84,1735.62,0.00166321],135.496],[[3058.62,1728.35,0.00119019],168.424],[[3066.16,1796.27,0.00213623],172.002],[[3069.31,1803.9,0.00167847],152.72],[[3062.43,1803.37,0.00195313],182.333],[[3075,1799.07,0.00135803],170.278],[[3132.92,1600.21,0.00157928],193.419],[[3143.55,1595.62,0.00164795],143.696],[[3142.15,1624.1,0.00167847],168.312],[[3148.1,1627.93,0.00154877],168.312],[[3140.77,1626.53,0.00141144],204.513],[[3148.98,1624.05,0.00201416],119.273]]