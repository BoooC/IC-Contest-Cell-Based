/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : U-2022.12
// Date      : Wed Jan 29 02:57:22 2025
/////////////////////////////////////////////////////////////


module SME ( clk, reset, chardata, isstring, ispattern, match, match_index, 
        valid );
  input [7:0] chardata;
  output [4:0] match_index;
  input clk, reset, isstring, ispattern;
  output match, valid;
  wire   n2833, n2834, n2835, n2836, n2837, n2838, n2839, isstring_reg,
         is_check_point_match, N617, N650, N651, N652, N653, star_exit, N699,
         N772, N773, N774, N775, N776, n845, n846, n847, n848, n849, n850,
         n851, n852, n853, n854, n855, n856, n857, n858, n859, n860, n861,
         n862, n863, n864, n865, n866, n867, n868, n869, n870, n871, n872,
         n873, n874, n875, n876, n877, n878, n879, n880, n881, n882, n883,
         n884, n885, n886, n887, n888, n889, n890, n891, n892, n893, n894,
         n895, n896, n897, n898, n899, n900, n901, n902, n903, n904, n905,
         n906, n907, n908, n909, n910, n911, n912, n913, n914, n915, n916,
         n917, n918, n919, n920, n921, n922, n923, n924, n925, n926, n927,
         n928, n929, n930, n931, n932, n933, n934, n935, n936, n937, n938,
         n939, n940, n941, n942, n943, n944, n945, n946, n947, n948, n949,
         n950, n951, n952, n953, n954, n955, n956, n957, n958, n959, n960,
         n961, n962, n963, n964, n965, n966, n967, n968, n969, n970, n971,
         n972, n973, n974, n975, n976, n977, n978, n979, n980, n981, n982,
         n983, n984, n985, n986, n987, n988, n989, n990, n991, n992, n993,
         n994, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004,
         n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014,
         n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024,
         n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034,
         n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044,
         n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054,
         n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064,
         n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074,
         n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084,
         n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094,
         n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104,
         n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114,
         n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124,
         n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134,
         n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144,
         n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154,
         n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164,
         n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174,
         n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184,
         n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1201, n1202,
         n1203, n1204, n1205, n1206, n1215, n1216, n1217, n1218, n1219, n1220,
         n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230,
         n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240,
         n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250,
         n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260,
         n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270,
         n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280,
         n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290,
         n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300,
         n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310,
         n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320,
         n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330,
         n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340,
         n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350,
         n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359, n1360,
         n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369, n1370,
         n1371, n1373, n1374, n1375, n1376, n1377, n1378, n1379, n1380, n1381,
         n1382, n1383, n1384, n1385, n1386, n1387, n1388, n1389, n1390, n1391,
         n1392, n1393, n1394, n1395, n1396, n1397, n1398, n1399, n1400, n1401,
         n1402, n1403, n1404, n1405, n1406, n1407, n1408, n1409, n1410, n1411,
         n1412, n1413, n1414, n1415, n1416, n1417, n1418, n1419, n1420, n1421,
         n1422, n1423, n1424, n1425, n1426, n1427, n1428, n1429, n1430, n1431,
         n1432, n1433, n1434, n1435, n1436, n1437, n1438, n1439, n1440, n1441,
         n1442, n1443, n1444, n1445, n1446, n1447, n1448, n1449, n1450, n1451,
         n1452, n1453, n1454, n1455, n1456, n1457, n1458, n1459, n1460, n1461,
         n1462, n1463, n1464, n1465, n1466, n1467, n1468, n1469, n1470, n1471,
         n1472, n1473, n1474, n1475, n1476, n1477, n1478, n1479, n1480, n1481,
         n1482, n1483, n1484, n1485, n1486, n1487, n1488, n1489, n1490, n1491,
         n1492, n1493, n1494, n1495, n1496, n1497, n1498, n1499, n1500, n1501,
         n1502, n1503, n1504, n1505, n1506, n1507, n1508, n1509, n1510, n1511,
         n1512, n1513, n1514, n1515, n1516, n1517, n1518, n1519, n1520, n1521,
         n1522, n1523, n1524, n1525, n1526, n1527, n1528, n1529, n1530, n1531,
         n1532, n1533, n1534, n1535, n1536, n1537, n1538, n1539, n1540, n1541,
         n1542, n1543, n1544, n1545, n1546, n1547, n1548, n1549, n1550, n1551,
         n1552, n1553, n1554, n1555, n1556, n1557, n1558, n1559, n1560, n1561,
         n1562, n1563, n1564, n1565, n1566, n1567, n1568, n1569, n1570, n1571,
         n1572, n1573, n1574, n1575, n1576, n1577, n1578, n1579, n1580, n1581,
         n1582, n1583, n1584, n1585, n1586, n1587, n1588, n1589, n1590, n1591,
         n1592, n1593, n1594, n1595, n1596, n1597, n1598, n1599, n1600, n1601,
         n1602, n1603, n1604, n1605, n1606, n1607, n1608, n1609, n1610, n1611,
         n1612, n1613, n1614, n1615, n1616, n1617, n1618, n1619, n1620, n1621,
         n1622, n1623, n1624, n1625, n1626, n1627, n1628, n1629, n1630, n1631,
         n1632, n1633, n1634, n1635, n1636, n1637, n1638, n1639, n1640, n1641,
         n1642, n1643, n1644, n1645, n1646, n1647, n1648, n1649, n1650, n1651,
         n1652, n1653, n1654, n1655, n1656, n1657, n1658, n1659, n1660, n1661,
         n1662, n1663, n1664, n1665, n1666, n1667, n1668, n1669, n1670, n1671,
         n1672, n1673, n1674, n1675, n1676, n1677, n1678, n1679, n1680, n1681,
         n1682, n1683, n1684, n1685, n1686, n1687, n1688, n1689, n1690, n1691,
         n1692, n1693, n1694, n1695, n1696, n1697, n1698, n1699, n1700, n1701,
         n1702, n1703, n1704, n1705, n1706, n1707, n1708, n1709, n1710, n1711,
         n1712, n1713, n1714, n1715, n1716, n1717, n1718, n1719, n1720, n1721,
         n1722, n1723, n1724, n1725, n1726, n1727, n1728, n1729, n1730, n1731,
         n1732, n1733, n1734, n1735, n1736, n1737, n1738, n1739, n1740, n1741,
         n1742, n1743, n1744, n1745, n1746, n1747, n1748, n1749, n1750, n1751,
         n1752, n1753, n1754, n1755, n1756, n1757, n1758, n1759, n1760, n1761,
         n1762, n1763, n1764, n1765, n1766, n1767, n1768, n1769, n1770, n1771,
         n1772, n1773, n1774, n1775, n1776, n1777, n1778, n1779, n1780, n1781,
         n1782, n1783, n1784, n1785, n1786, n1787, n1788, n1789, n1790, n1791,
         n1792, n1793, n1794, n1795, n1796, n1797, n1798, n1799, n1800, n1801,
         n1802, n1803, n1804, n1805, n1806, n1807, n1808, n1809, n1810, n1811,
         n1812, n1813, n1814, n1815, n1816, n1817, n1818, n1819, n1820, n1821,
         n1822, n1823, n1824, n1825, n1826, n1827, n1828, n1829, n1830, n1831,
         n1832, n1833, n1834, n1835, n1836, n1837, n1838, n1839, n1840, n1841,
         n1842, n1843, n1844, n1845, n1846, n1847, n1848, n1849, n1850, n1851,
         n1852, n1853, n1854, n1855, n1856, n1857, n1858, n1859, n1860, n1861,
         n1862, n1863, n1864, n1865, n1866, n1867, n1868, n1869, n1870, n1871,
         n1872, n1873, n1874, n1875, n1876, n1877, n1878, n1879, n1880, n1881,
         n1882, n1883, n1884, n1885, n1886, n1887, n1888, n1889, n1890, n1891,
         n1892, n1893, n1894, n1895, n1896, n1897, n1898, n1899, n1900, n1901,
         n1902, n1903, n1904, n1905, n1906, n1907, n1908, n1909, n1910, n1911,
         n1912, n1913, n1914, n1915, n1916, n1917, n1918, n1919, n1920, n1921,
         n1922, n1923, n1924, n1925, n1926, n1927, n1928, n1929, n1930, n1931,
         n1932, n1933, n1934, n1935, n1936, n1937, n1938, n1939, n1940, n1941,
         n1942, n1943, n1944, n1945, n1946, n1947, n1948, n1949, n1950, n1951,
         n1952, n1953, n1954, n1955, n1956, n1957, n1958, n1959, n1960, n1961,
         n1962, n1963, n1964, n1965, n1966, n1967, n1968, n1969, n1970, n1971,
         n1972, n1973, n1974, n1975, n1976, n1977, n1978, n1979, n1980, n1981,
         n1982, n1983, n1984, n1985, n1986, n1987, n1988, n1989, n1990, n1991,
         n1992, n1993, n1994, n1995, n1996, n1997, n1998, n1999, n2000, n2001,
         n2002, n2003, n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011,
         n2012, n2013, n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021,
         n2022, n2023, n2024, n2025, n2026, n2027, n2028, n2029, n2030, n2031,
         n2032, n2033, n2034, n2035, n2036, n2037, n2038, n2039, n2040, n2041,
         n2042, n2043, n2044, n2045, n2046, n2047, n2048, n2049, n2050, n2051,
         n2052, n2053, n2054, n2055, n2056, n2057, n2058, n2059, n2060, n2061,
         n2062, n2063, n2064, n2065, n2066, n2067, n2068, n2069, n2070, n2071,
         n2072, n2073, n2074, n2075, n2076, n2077, n2078, n2079, n2080, n2081,
         n2082, n2083, n2084, n2085, n2086, n2087, n2088, n2089, n2090, n2091,
         n2092, n2093, n2094, n2095, n2096, n2097, n2098, n2099, n2100, n2101,
         n2102, n2103, n2104, n2105, n2106, n2107, n2108, n2109, n2110, n2111,
         n2112, n2113, n2114, n2115, n2116, n2117, n2118, n2119, n2120, n2121,
         n2122, n2123, n2124, n2125, n2126, n2127, n2128, n2129, n2130, n2131,
         n2132, n2133, n2134, n2135, n2136, n2137, n2138, n2139, n2140, n2141,
         n2142, n2143, n2144, n2145, n2146, n2147, n2148, n2149, n2150, n2151,
         n2152, n2153, n2154, n2155, n2156, n2157, n2158, n2159, n2160, n2161,
         n2162, n2163, n2164, n2165, n2166, n2167, n2168, n2169, n2170, n2171,
         n2172, n2173, n2174, n2175, n2176, n2177, n2178, n2179, n2180, n2181,
         n2182, n2183, n2184, n2185, n2186, n2187, n2188, n2189, n2190, n2191,
         n2192, n2193, n2194, n2195, n2196, n2197, n2198, n2199, n2200, n2201,
         n2202, n2203, n2204, n2205, n2206, n2207, n2208, n2209, n2210, n2211,
         n2212, n2213, n2214, n2215, n2216, n2217, n2218, n2219, n2220, n2221,
         n2222, n2223, n2224, n2225, n2226, n2227, n2228, n2229, n2230, n2231,
         n2232, n2233, n2234, n2235, n2236, n2237, n2238, n2239, n2240, n2241,
         n2242, n2243, n2244, n2245, n2246, n2247, n2248, n2249, n2250, n2251,
         n2252, n2253, n2254, n2255, n2256, n2257, n2258, n2259, n2260, n2261,
         n2262, n2263, n2264, n2265, n2266, n2267, n2268, n2269, n2270, n2271,
         n2272, n2273, n2274, n2275, n2276, n2277, n2278, n2279, n2280, n2281,
         n2282, n2283, n2284, n2285, n2286, n2287, n2288, n2289, n2290, n2291,
         n2292, n2293, n2294, n2295, n2296, n2297, n2298, n2299, n2300, n2301,
         n2302, n2303, n2304, n2305, n2306, n2307, n2308, n2309, n2310, n2311,
         n2312, n2313, n2314, n2315, n2316, n2317, n2318, n2319, n2320, n2321,
         n2322, n2323, n2324, n2325, n2326, n2327, n2328, n2329, n2330, n2331,
         n2332, n2333, n2334, n2335, n2336, n2337, n2338, n2339, n2340, n2341,
         n2342, n2343, n2344, n2345, n2346, n2347, n2348, n2349, n2350, n2351,
         n2352, n2353, n2354, n2355, n2356, n2357, n2358, n2359, n2360, n2361,
         n2362, n2363, n2364, n2365, n2366, n2367, n2368, n2369, n2370, n2371,
         n2372, n2373, n2374, n2375, n2376, n2377, n2378, n2379, n2380, n2381,
         n2382, n2383, n2384, n2385, n2386, n2387, n2388, n2389, n2390, n2391,
         n2392, n2393, n2394, n2395, n2396, n2397, n2398, n2399, n2400, n2401,
         n2402, n2403, n2404, n2405, n2406, n2407, n2408, n2409, n2410, n2411,
         n2412, n2413, n2414, n2415, n2416, n2417, n2418, n2419, n2420, n2421,
         n2422, n2423, n2424, n2425, n2426, n2427, n2428, n2429, n2430, n2431,
         n2432, n2433, n2434, n2435, n2436, n2437, n2438, n2439, n2440, n2441,
         n2442, n2443, n2444, n2445, n2446, n2447, n2448, n2449, n2450, n2451,
         n2452, n2453, n2454, n2455, n2456, n2457, n2458, n2459, n2460, n2461,
         n2462, n2463, n2464, n2465, n2466, n2467, n2468, n2469, n2470, n2471,
         n2472, n2473, n2474, n2475, n2476, n2477, n2478, n2479, n2480, n2481,
         n2482, n2483, n2484, n2485, n2486, n2487, n2488, n2489, n2490, n2491,
         n2492, n2493, n2494, n2495, n2496, n2497, n2498, n2499, n2500, n2501,
         n2502, n2503, n2504, n2505, n2506, n2507, n2508, n2509, n2510, n2511,
         n2512, n2513, n2514, n2515, n2516, n2517, n2518, n2519, n2520, n2521,
         n2522, n2523, n2524, n2525, n2526, n2527, n2528, n2529, n2530, n2531,
         n2532, n2533, n2534, n2535, n2536, n2537, n2538, n2539, n2540, n2541,
         n2542, n2543, n2544, n2545, n2546, n2547, n2548, n2549, n2550, n2551,
         n2552, n2553, n2554, n2555, n2556, n2557, n2558, n2559, n2560, n2561,
         n2562, n2563, n2564, n2565, n2566, n2567, n2568, n2569, n2570, n2571,
         n2572, n2573, n2574, n2575, n2576, n2577, n2578, n2579, n2580, n2581,
         n2582, n2583, n2584, n2585, n2586, n2587, n2588, n2589, n2590, n2591,
         n2592, n2593, n2594, n2595, n2596, n2597, n2598, n2599, n2600, n2601,
         n2602, n2603, n2604, n2605, n2606, n2607, n2608, n2609, n2610, n2611,
         n2612, n2613, n2614, n2615, n2616, n2617, n2618, n2619, n2620, n2621,
         n2622, n2623, n2624, n2625, n2626, n2627, n2628, n2629, n2630, n2631,
         n2632, n2633, n2634, n2635, n2636, n2637, n2638, n2639, n2640, n2641,
         n2642, n2643, n2644, n2645, n2646, n2647, n2648, n2649, n2650, n2651,
         n2652, n2653, n2654, n2655, n2656, n2657, n2658, n2659, n2660, n2661,
         n2662, n2663, n2664, n2665, n2666, n2667, n2668, n2669, n2670, n2671,
         n2672, n2673, n2674, n2675, n2676, n2677, n2678, n2679, n2680, n2681,
         n2682, n2683, n2684, n2685, n2686, n2687, n2688, n2689, n2690, n2691,
         n2692, n2693, n2694, n2695, n2696, n2697, n2698, n2699, n2700, n2701,
         n2702, n2703, n2704, n2705, n2706, n2707, n2708, n2709, n2710, n2711,
         n2712, n2713, n2714, n2715, n2716, n2717, n2718, n2719, n2720, n2721,
         n2722, n2723, n2724, n2725, n2726, n2727, n2728, n2729, n2730, n2731,
         n2732, n2733, n2734, n2735, n2736, n2737, n2738, n2739, n2740, n2741,
         n2742, n2743, n2744, n2745, n2746, n2747, n2748, n2749, n2750, n2751,
         n2752, n2753, n2754, n2755, n2756, n2757, n2758, n2759, n2760, n2761,
         n2762, n2763, n2764, n2765, n2766, n2767, n2768, n2769, n2770, n2771,
         n2772, n2773, n2774, n2775, n2776, n2777, n2778, n2779, n2780, n2781,
         n2782, n2783, n2784, n2785, n2786, n2787, n2788, n2789, n2790, n2791,
         n2792, n2793, n2794, n2795, n2796, n2797, n2798, n2799, n2800, n2801,
         n2802, n2803, n2804, n2805, n2806, n2807, n2808, n2809, n2810, n2811,
         n2812, n2813, n2821, n2822, n2823, n2824, n2825, n2826, n2827, n2828,
         n2829, n2830, n2831, n2832;
  wire   [3:0] pat_match_count;
  wire   [59:0] PATTERN;
  wire   [5:0] str_start_idx;
  wire   [253:0] STRING;
  wire   [3:0] pat_count;
  wire   [5:0] str_count;
  wire   [1:0] state;
  wire   [1:0] next_state;
  wire   [3:0] check_point_idx;
  wire   [4:0] star_exit_start_idx;

  DFFRX2 STRING_reg_1__4_ ( .D(n1188), .CK(clk), .RN(n2828), .Q(STRING[250]), 
        .QN(n2799) );
  DFFRX2 STRING_reg_1__0_ ( .D(n1192), .CK(clk), .RN(n2831), .Q(STRING[246])
         );
  DFFRX2 STRING_reg_3__0_ ( .D(n1176), .CK(clk), .RN(n2831), .Q(STRING[230]), 
        .QN(n2804) );
  DFFRX2 STRING_reg_11__0_ ( .D(n1112), .CK(clk), .RN(n2832), .Q(STRING[174])
         );
  DFFRX2 STRING_reg_14__0_ ( .D(n1088), .CK(clk), .RN(n2832), .Q(STRING[152]), 
        .QN(n2650) );
  DFFRX2 STRING_reg_15__0_ ( .D(n1080), .CK(clk), .RN(n2832), .Q(STRING[144]), 
        .QN(n2647) );
  DFFRX2 STRING_reg_17__0_ ( .D(n1064), .CK(clk), .RN(n2830), .Q(STRING[128])
         );
  DFFRX2 STRING_reg_25__0_ ( .D(n1000), .CK(clk), .RN(n2830), .Q(STRING[64])
         );
  DFFRX2 STRING_reg_1__7_ ( .D(n1191), .CK(clk), .RN(n2044), .Q(STRING[253])
         );
  DFFRX2 STRING_reg_4__7_ ( .D(n1167), .CK(clk), .RN(n2826), .Q(STRING[229]), 
        .QN(n2733) );
  DFFRX2 STRING_reg_5__7_ ( .D(n1159), .CK(clk), .RN(n2826), .Q(STRING[223]), 
        .QN(n2732) );
  DFFRX2 STRING_reg_10__7_ ( .D(n1119), .CK(clk), .RN(n2826), .Q(STRING[189])
         );
  DFFRX2 STRING_reg_11__7_ ( .D(n1111), .CK(clk), .RN(n2826), .Q(STRING[181])
         );
  DFFRX2 STRING_reg_17__7_ ( .D(n1063), .CK(clk), .RN(n2827), .Q(STRING[135])
         );
  DFFRX2 STRING_reg_20__7_ ( .D(n1039), .CK(clk), .RN(n1222), .Q(STRING[111]), 
        .QN(n2747) );
  DFFRX2 STRING_reg_21__7_ ( .D(n1031), .CK(clk), .RN(n1222), .Q(STRING[103]), 
        .QN(n2743) );
  DFFRX2 STRING_reg_23__7_ ( .D(n1015), .CK(clk), .RN(n2829), .Q(STRING[87]), 
        .QN(n2652) );
  DFFRX2 STRING_reg_25__7_ ( .D(n999), .CK(clk), .RN(n2044), .Q(STRING[71]) );
  DFFRX2 STRING_reg_5__6_ ( .D(n1158), .CK(clk), .RN(n2831), .Q(STRING[222]), 
        .QN(n2742) );
  DFFRX2 STRING_reg_6__6_ ( .D(n1150), .CK(clk), .RN(n2826), .Q(STRING[216]), 
        .QN(n2654) );
  DFFRX2 STRING_reg_7__6_ ( .D(n1142), .CK(clk), .RN(n2828), .Q(STRING[210]), 
        .QN(n2651) );
  DFFRX2 STRING_reg_8__6_ ( .D(n1134), .CK(clk), .RN(n2832), .Q(STRING[204])
         );
  DFFRX2 STRING_reg_9__6_ ( .D(n1126), .CK(clk), .RN(n2830), .Q(STRING[196])
         );
  DFFRX2 STRING_reg_10__6_ ( .D(n1118), .CK(clk), .RN(n2831), .Q(STRING[188])
         );
  DFFRX2 STRING_reg_11__6_ ( .D(n1110), .CK(clk), .RN(n2822), .Q(STRING[180])
         );
  DFFRX2 STRING_reg_19__6_ ( .D(n1046), .CK(clk), .RN(n2829), .Q(STRING[118])
         );
  DFFRX2 STRING_reg_24__6_ ( .D(n1006), .CK(clk), .RN(n2826), .Q(STRING[78])
         );
  DFFRX2 STRING_reg_25__6_ ( .D(n998), .CK(clk), .RN(n2831), .Q(STRING[70]) );
  DFFRX2 STRING_reg_26__6_ ( .D(n990), .CK(clk), .RN(n2827), .Q(STRING[62]) );
  DFFRX2 STRING_reg_28__6_ ( .D(n974), .CK(clk), .RN(n2826), .Q(STRING[46]), 
        .QN(n2767) );
  DFFRX2 STRING_reg_29__6_ ( .D(n966), .CK(clk), .RN(n2830), .Q(STRING[38]), 
        .QN(n2763) );
  DFFRX2 STRING_reg_30__6_ ( .D(n958), .CK(clk), .RN(n2827), .Q(STRING[30]), 
        .QN(n2681) );
  DFFRX2 STRING_reg_6__4_ ( .D(n1148), .CK(clk), .RN(n2829), .Q(STRING[214]), 
        .QN(n2661) );
  DFFRX2 STRING_reg_8__4_ ( .D(n1132), .CK(clk), .RN(n2829), .Q(STRING[202])
         );
  DFFRX2 STRING_reg_9__4_ ( .D(n1124), .CK(clk), .RN(n2829), .Q(STRING[194])
         );
  DFFRX2 STRING_reg_11__4_ ( .D(n1108), .CK(clk), .RN(n2829), .Q(STRING[178])
         );
  DFFRX2 STRING_reg_16__4_ ( .D(n1068), .CK(clk), .RN(n2827), .Q(STRING[140])
         );
  DFFRX2 STRING_reg_19__4_ ( .D(n1044), .CK(clk), .RN(n2827), .Q(STRING[116])
         );
  DFFRX2 STRING_reg_23__4_ ( .D(n1012), .CK(clk), .RN(n2827), .Q(STRING[84]), 
        .QN(n2677) );
  DFFRX2 STRING_reg_26__4_ ( .D(n988), .CK(clk), .RN(n2828), .Q(STRING[60]) );
  DFFRX2 STRING_reg_28__4_ ( .D(n972), .CK(clk), .RN(n2828), .Q(STRING[44]), 
        .QN(n2771) );
  DFFRX2 STRING_reg_30__4_ ( .D(n956), .CK(clk), .RN(n2828), .Q(STRING[28]), 
        .QN(n2685) );
  DFFRX2 STRING_reg_31__4_ ( .D(n948), .CK(clk), .RN(n2828), .Q(STRING[20]), 
        .QN(n2684) );
  DFFRX2 STRING_reg_1__3_ ( .D(n1187), .CK(clk), .RN(n1222), .Q(STRING[249])
         );
  DFFRX2 STRING_reg_14__3_ ( .D(n1083), .CK(clk), .RN(n2829), .Q(STRING[154]), 
        .QN(n2738) );
  DFFRX2 STRING_reg_15__3_ ( .D(n1075), .CK(clk), .RN(n1222), .Q(STRING[147]), 
        .QN(n2736) );
  DFFRX2 STRING_reg_17__3_ ( .D(n1059), .CK(clk), .RN(n2044), .Q(STRING[131])
         );
  DFFRX2 STRING_reg_25__3_ ( .D(n995), .CK(clk), .RN(n2829), .Q(STRING[67]) );
  DFFRX2 STRING_reg_26__3_ ( .D(n987), .CK(clk), .RN(n2827), .Q(STRING[59]) );
  DFFRX2 STRING_reg_1__2_ ( .D(n1186), .CK(clk), .RN(n1222), .Q(STRING[248])
         );
  DFFRX2 STRING_reg_3__2_ ( .D(n1170), .CK(clk), .RN(n2832), .Q(STRING[232]), 
        .QN(n2806) );
  DFFRX2 STRING_reg_4__2_ ( .D(n1162), .CK(clk), .RN(n1222), .Q(STRING[225]), 
        .QN(n2740) );
  DFFRX2 STRING_reg_5__2_ ( .D(n1154), .CK(clk), .RN(n1222), .Q(STRING[219]), 
        .QN(n2739) );
  DFFRX2 STRING_reg_6__2_ ( .D(n1146), .CK(clk), .RN(n2830), .Q(STRING[213]), 
        .QN(n2646) );
  DFFRX2 STRING_reg_7__2_ ( .D(n1138), .CK(clk), .RN(n2825), .Q(STRING[207]), 
        .QN(n2643) );
  DFFRX2 STRING_reg_17__2_ ( .D(n1058), .CK(clk), .RN(n2829), .Q(STRING[130])
         );
  DFFRX2 STRING_reg_25__2_ ( .D(n994), .CK(clk), .RN(n2044), .Q(STRING[66]) );
  DFFRX2 STRING_reg_1__1_ ( .D(n1185), .CK(clk), .RN(n2822), .Q(STRING[247])
         );
  DFFRX2 STRING_reg_4__1_ ( .D(n1161), .CK(clk), .RN(n2823), .Q(STRING[224]), 
        .QN(n2746) );
  DFFRX2 STRING_reg_5__1_ ( .D(n1153), .CK(clk), .RN(n2823), .Q(STRING[218]), 
        .QN(n2744) );
  DFFRX2 STRING_reg_6__1_ ( .D(n1145), .CK(clk), .RN(n2823), .Q(STRING[212]), 
        .QN(n2657) );
  DFFRX2 STRING_reg_7__1_ ( .D(n1137), .CK(clk), .RN(n2823), .Q(STRING[206]), 
        .QN(n2653) );
  DFFRX2 STRING_reg_8__1_ ( .D(n1129), .CK(clk), .RN(n2823), .Q(STRING[199])
         );
  DFFRX2 STRING_reg_9__1_ ( .D(n1121), .CK(clk), .RN(n2823), .Q(STRING[191])
         );
  DFFRX2 STRING_reg_11__1_ ( .D(n1105), .CK(clk), .RN(n2823), .Q(STRING[175])
         );
  DFFRX2 STRING_reg_13__1_ ( .D(n1089), .CK(clk), .RN(n2823), .Q(STRING[159]), 
        .QN(n2673) );
  DFFRX2 STRING_reg_15__1_ ( .D(n1073), .CK(clk), .RN(n2823), .Q(STRING[145]), 
        .QN(n2758) );
  DFFRX2 STRING_reg_19__1_ ( .D(n1041), .CK(clk), .RN(n1222), .Q(STRING[113])
         );
  DFFRX2 STRING_reg_22__1_ ( .D(n1017), .CK(clk), .RN(n1222), .Q(STRING[89]), 
        .QN(n2672) );
  DFFRX2 STRING_reg_23__1_ ( .D(n1009), .CK(clk), .RN(n1222), .Q(STRING[81]), 
        .QN(n2670) );
  DFFRX2 STRING_reg_26__1_ ( .D(n985), .CK(clk), .RN(n2822), .Q(STRING[57]) );
  DFFRX1 check_point_idx_reg_0_ ( .D(n928), .CK(clk), .RN(n2827), .Q(
        check_point_idx[0]), .QN(n2793) );
  DFFRX4 pat_match_count_reg_0_ ( .D(N650), .CK(clk), .RN(n2828), .Q(
        pat_match_count[0]), .QN(n2821) );
  DFFRX1 check_point_idx_reg_2_ ( .D(n852), .CK(clk), .RN(n2044), .Q(
        check_point_idx[2]), .QN(n2795) );
  DFFRX4 pat_match_count_reg_2_ ( .D(N652), .CK(clk), .RN(n2827), .Q(
        pat_match_count[2]), .QN(n2609) );
  DFFRX4 pat_match_count_reg_1_ ( .D(N651), .CK(clk), .RN(n1222), .Q(
        pat_match_count[1]), .QN(n2701) );
  DFFRX1 check_point_idx_reg_1_ ( .D(n853), .CK(clk), .RN(n2827), .Q(
        check_point_idx[1]), .QN(n2794) );
  DFFRX1 PATTERN_reg_7__0_ ( .D(n923), .CK(clk), .RN(n1222), .Q(PATTERN[0]) );
  DFFRX1 PATTERN_reg_7__7_ ( .D(n922), .CK(clk), .RN(n2829), .Q(PATTERN[7]), 
        .QN(n1376) );
  DFFRX1 PATTERN_reg_7__6_ ( .D(n921), .CK(clk), .RN(n2828), .Q(PATTERN[6]) );
  DFFRX1 PATTERN_reg_7__5_ ( .D(n920), .CK(clk), .RN(n2824), .Q(PATTERN[5]) );
  DFFRX1 PATTERN_reg_7__4_ ( .D(n919), .CK(clk), .RN(n2827), .Q(PATTERN[4]) );
  DFFRX1 PATTERN_reg_7__3_ ( .D(n918), .CK(clk), .RN(n2829), .Q(PATTERN[3]) );
  DFFRX1 PATTERN_reg_7__2_ ( .D(n917), .CK(clk), .RN(n1222), .Q(PATTERN[2]) );
  DFFRX1 PATTERN_reg_7__1_ ( .D(n916), .CK(clk), .RN(n2824), .Q(PATTERN[1]) );
  DFFRX2 PATTERN_reg_6__6_ ( .D(n913), .CK(clk), .RN(n1222), .Q(PATTERN[14])
         );
  DFFRX2 PATTERN_reg_6__4_ ( .D(n911), .CK(clk), .RN(n2044), .Q(PATTERN[12])
         );
  DFFRX2 PATTERN_reg_6__2_ ( .D(n909), .CK(clk), .RN(n1222), .Q(PATTERN[10]), 
        .QN(n2704) );
  DFFRX1 PATTERN_reg_3__0_ ( .D(n891), .CK(clk), .RN(n1222), .Q(PATTERN[32])
         );
  DFFRX1 PATTERN_reg_3__7_ ( .D(n890), .CK(clk), .RN(n2824), .Q(PATTERN[39]), 
        .QN(n1366) );
  DFFRX1 PATTERN_reg_3__6_ ( .D(n889), .CK(clk), .RN(n2829), .Q(PATTERN[38])
         );
  DFFRX1 PATTERN_reg_3__5_ ( .D(n888), .CK(clk), .RN(n2827), .Q(PATTERN[37])
         );
  DFFRX1 PATTERN_reg_3__4_ ( .D(n887), .CK(clk), .RN(n2827), .Q(PATTERN[36])
         );
  DFFRX1 PATTERN_reg_3__3_ ( .D(n886), .CK(clk), .RN(n2827), .Q(PATTERN[35])
         );
  DFFRX1 PATTERN_reg_3__2_ ( .D(n885), .CK(clk), .RN(n1222), .Q(PATTERN[34])
         );
  DFFRX1 PATTERN_reg_3__1_ ( .D(n884), .CK(clk), .RN(n2824), .Q(PATTERN[33])
         );
  DFFRX1 PATTERN_reg_2__7_ ( .D(n882), .CK(clk), .RN(n2829), .Q(PATTERN[47]), 
        .QN(n2612) );
  DFFRX1 PATTERN_reg_2__6_ ( .D(n881), .CK(clk), .RN(n2828), .Q(PATTERN[46])
         );
  DFFRX1 PATTERN_reg_2__5_ ( .D(n880), .CK(clk), .RN(n2824), .Q(PATTERN[45])
         );
  DFFRX1 PATTERN_reg_2__4_ ( .D(n879), .CK(clk), .RN(n2828), .Q(PATTERN[44])
         );
  DFFRX1 PATTERN_reg_2__3_ ( .D(n878), .CK(clk), .RN(n2829), .Q(PATTERN[43])
         );
  DFFRX1 PATTERN_reg_2__1_ ( .D(n876), .CK(clk), .RN(n2828), .Q(PATTERN[41])
         );
  DFFRX2 PATTERN_reg_5__7_ ( .D(n906), .CK(clk), .RN(n2044), .Q(PATTERN[23]), 
        .QN(n2611) );
  DFFRX2 PATTERN_reg_5__6_ ( .D(n905), .CK(clk), .RN(n2828), .Q(PATTERN[22]), 
        .QN(n2729) );
  DFFRX2 PATTERN_reg_5__2_ ( .D(n901), .CK(clk), .RN(n2827), .Q(PATTERN[18]), 
        .QN(n2610) );
  DFFRX2 PATTERN_reg_5__1_ ( .D(n900), .CK(clk), .RN(n2824), .Q(PATTERN[17]), 
        .QN(n2737) );
  DFFRX2 PATTERN_reg_4__7_ ( .D(n898), .CK(clk), .RN(n2044), .Q(PATTERN[31])
         );
  DFFRX2 PATTERN_reg_4__4_ ( .D(n895), .CK(clk), .RN(n2044), .Q(PATTERN[28])
         );
  DFFRX2 PATTERN_reg_1__6_ ( .D(n873), .CK(clk), .RN(n1222), .Q(PATTERN[54]), 
        .QN(n2636) );
  DFFRX2 PATTERN_reg_0__0_ ( .D(n867), .CK(clk), .RN(n1222), .Q(PATTERN[56])
         );
  DFFRX2 PATTERN_reg_0__7_ ( .D(n866), .CK(clk), .RN(n2829), .Q(PATTERN[59])
         );
  DFFRX2 PATTERN_reg_0__4_ ( .D(n863), .CK(clk), .RN(n2044), .Q(PATTERN[58])
         );
  DFFRX2 PATTERN_reg_0__2_ ( .D(n861), .CK(clk), .RN(n2829), .Q(PATTERN[57])
         );
  DFFRX4 str_start_idx_reg_0_ ( .D(n858), .CK(clk), .RN(n2828), .Q(
        str_start_idx[0]), .QN(n2698) );
  DFFRX4 str_start_idx_reg_1_ ( .D(n857), .CK(clk), .RN(n2828), .Q(
        str_start_idx[1]), .QN(n2696) );
  DFFRX1 check_point_idx_reg_3_ ( .D(n851), .CK(clk), .RN(n2828), .Q(
        check_point_idx[3]), .QN(n2796) );
  DFFRX4 pat_match_count_reg_3_ ( .D(N653), .CK(clk), .RN(n2828), .Q(
        pat_match_count[3]), .QN(n2783) );
  DFFRX1 star_exit_reg ( .D(n850), .CK(clk), .RN(n2825), .Q(star_exit) );
  DFFRX1 star_exit_start_idx_reg_4_ ( .D(n849), .CK(clk), .RN(n2825), .Q(
        star_exit_start_idx[4]), .QN(n2792) );
  DFFRX1 star_exit_start_idx_reg_3_ ( .D(n848), .CK(clk), .RN(n2825), .Q(
        star_exit_start_idx[3]), .QN(n2790) );
  DFFRX1 star_exit_start_idx_reg_2_ ( .D(n847), .CK(clk), .RN(n2825), .QN(
        n2778) );
  DFFRX1 star_exit_start_idx_reg_1_ ( .D(n846), .CK(clk), .RN(n2825), .Q(
        star_exit_start_idx[1]), .QN(n2789) );
  DFFRX1 star_exit_start_idx_reg_0_ ( .D(n845), .CK(clk), .RN(n2825), .Q(
        star_exit_start_idx[0]), .QN(n2788) );
  DFFRX4 str_start_idx_reg_3_ ( .D(n855), .CK(clk), .RN(n2830), .Q(
        str_start_idx[3]), .QN(n2620) );
  DFFRX4 str_start_idx_reg_2_ ( .D(n856), .CK(clk), .RN(n2826), .Q(
        str_start_idx[2]), .QN(n2589) );
  DFFRX2 str_start_idx_reg_5_ ( .D(n859), .CK(clk), .RN(n2828), .Q(
        str_start_idx[5]), .QN(n2780) );
  DFFRX1 STRING_reg_2__1_ ( .D(n1177), .CK(clk), .RN(n2822), .Q(STRING[239]), 
        .QN(n2813) );
  DFFRX2 str_count_reg_1_ ( .D(n1206), .CK(clk), .RN(n2828), .Q(str_count[1]), 
        .QN(n2781) );
  DFFRX1 pat_count_reg_3_ ( .D(n924), .CK(clk), .RN(n2827), .Q(pat_count[3]), 
        .QN(n2782) );
  DFFRX1 state_reg_1_ ( .D(next_state[1]), .CK(clk), .RN(n2827), .Q(state[1]), 
        .QN(n2785) );
  DFFRX1 str_count_reg_5_ ( .D(n1201), .CK(clk), .RN(n2828), .Q(str_count[5]), 
        .QN(n2797) );
  DFFRX1 str_count_reg_4_ ( .D(n1202), .CK(clk), .RN(n2828), .Q(str_count[4]), 
        .QN(n2791) );
  DFFRX1 STRING_reg_17__5_ ( .D(n1061), .CK(clk), .RN(n2829), .Q(STRING[133]), 
        .QN(n2639) );
  DFFRX1 STRING_reg_16__5_ ( .D(n1069), .CK(clk), .RN(n2827), .Q(STRING[141]), 
        .QN(n2638) );
  DFFRX1 STRING_reg_29__5_ ( .D(n965), .CK(clk), .RN(n1222), .Q(STRING[37]), 
        .QN(n2735) );
  DFFRX1 STRING_reg_28__5_ ( .D(n973), .CK(clk), .RN(n2824), .Q(STRING[45]), 
        .QN(n2734) );
  DFFRX1 STRING_reg_19__5_ ( .D(n1045), .CK(clk), .RN(n2827), .Q(STRING[117]), 
        .QN(n2730) );
  DFFRX1 match_index_reg_0_ ( .D(N772), .CK(clk), .RN(n2825), .Q(n2838) );
  DFFRX1 STRING_reg_18__5_ ( .D(n1053), .CK(clk), .RN(n2822), .Q(STRING[125]), 
        .QN(n2637) );
  DFFRX1 STRING_reg_32__5_ ( .D(n941), .CK(clk), .RN(n2824), .Q(STRING[13]), 
        .QN(n2649) );
  DFFRX1 STRING_reg_33__5_ ( .D(n933), .CK(clk), .RN(n2828), .Q(STRING[5]), 
        .QN(n2741) );
  DFFRX1 STRING_reg_31__5_ ( .D(n949), .CK(clk), .RN(n2823), .Q(STRING[21]), 
        .QN(n2635) );
  DFFRX1 STRING_reg_3__5_ ( .D(n1173), .CK(clk), .RN(n2825), .Q(STRING[235]), 
        .QN(n2803) );
  DFFRX1 STRING_reg_32__4_ ( .D(n940), .CK(clk), .RN(n2827), .Q(STRING[12]), 
        .QN(n2608) );
  DFFRX1 STRING_reg_33__4_ ( .D(n932), .CK(clk), .RN(n2827), .Q(STRING[4]), 
        .QN(n2692) );
  DFFRX1 STRING_reg_32__2_ ( .D(n938), .CK(clk), .RN(n2829), .Q(STRING[10]), 
        .QN(n2607) );
  DFFRX1 STRING_reg_33__2_ ( .D(n930), .CK(clk), .RN(n2829), .Q(STRING[2]), 
        .QN(n2690) );
  DFFRX1 str_count_reg_3_ ( .D(n1203), .CK(clk), .RN(n2828), .QN(n2787) );
  DFFRX1 STRING_reg_1__5_ ( .D(n1189), .CK(clk), .RN(n2829), .Q(STRING[251])
         );
  DFFRX1 STRING_reg_21__5_ ( .D(n1029), .CK(clk), .RN(n2823), .Q(STRING[101]), 
        .QN(n2659) );
  DFFRX1 STRING_reg_32__6_ ( .D(n942), .CK(clk), .RN(n2832), .Q(STRING[14]), 
        .QN(n2689) );
  DFFRX1 STRING_reg_33__6_ ( .D(n934), .CK(clk), .RN(n2832), .Q(STRING[6]), 
        .QN(n2776) );
  DFFRX1 STRING_reg_10__5_ ( .D(n1117), .CK(clk), .RN(n2828), .Q(STRING[187])
         );
  DFFRX1 STRING_reg_15__5_ ( .D(n1077), .CK(clk), .RN(n2822), .Q(STRING[149]), 
        .QN(n2679) );
  DFFRX1 STRING_reg_13__5_ ( .D(n1093), .CK(clk), .RN(n2827), .Q(STRING[163]), 
        .QN(n2764) );
  DFFRX1 STRING_reg_32__0_ ( .D(n944), .CK(clk), .RN(n2830), .Q(STRING[8]), 
        .QN(n2674) );
  DFFRX1 STRING_reg_25__5_ ( .D(n997), .CK(clk), .RN(n2825), .Q(STRING[69]) );
  DFFRX1 STRING_reg_33__0_ ( .D(n936), .CK(clk), .RN(n2830), .Q(STRING[0]), 
        .QN(n2602) );
  DFFRX1 STRING_reg_4__5_ ( .D(n1165), .CK(clk), .RN(n2829), .Q(STRING[227]), 
        .QN(n2798) );
  DFFRX1 STRING_reg_7__5_ ( .D(n1141), .CK(clk), .RN(n2044), .Q(STRING[209]), 
        .QN(n2753) );
  DFFRX1 STRING_reg_32__7_ ( .D(n943), .CK(clk), .RN(n1222), .Q(STRING[15]), 
        .QN(n2606) );
  DFFRX1 STRING_reg_33__7_ ( .D(n935), .CK(clk), .RN(n1222), .Q(STRING[7]), 
        .QN(n2688) );
  DFFRX1 STRING_reg_23__5_ ( .D(n1013), .CK(clk), .RN(n2823), .Q(STRING[85]), 
        .QN(n2748) );
  DFFRX1 STRING_reg_32__3_ ( .D(n939), .CK(clk), .RN(n2829), .Q(STRING[11]), 
        .QN(n2756) );
  DFFRX1 STRING_reg_33__3_ ( .D(n931), .CK(clk), .RN(n2044), .Q(STRING[3]), 
        .QN(n2668) );
  DFFRX1 STRING_reg_6__5_ ( .D(n1149), .CK(clk), .RN(n2829), .Q(STRING[215]), 
        .QN(n2754) );
  DFFRX1 STRING_reg_26__5_ ( .D(n989), .CK(clk), .RN(n2829), .Q(STRING[61]) );
  DFFRX1 STRING_reg_32__1_ ( .D(n937), .CK(clk), .RN(n1222), .Q(STRING[9]), 
        .QN(n2691) );
  DFFRX1 STRING_reg_33__1_ ( .D(n929), .CK(clk), .RN(n1222), .Q(STRING[1]), 
        .QN(n2777) );
  DFFRX1 STRING_reg_27__5_ ( .D(n981), .CK(clk), .RN(n1222), .Q(STRING[53]) );
  DFFRX1 STRING_reg_12__5_ ( .D(n1101), .CK(clk), .RN(n2044), .Q(STRING[171]), 
        .QN(n2768) );
  DFFRX1 STRING_reg_24__5_ ( .D(n1005), .CK(clk), .RN(n2824), .Q(STRING[77])
         );
  DFFRX1 pat_count_reg_2_ ( .D(n925), .CK(clk), .RN(n2827), .Q(pat_count[2]), 
        .QN(n2695) );
  DFFRX1 STRING_reg_14__5_ ( .D(n1085), .CK(clk), .RN(n2044), .Q(STRING[156]), 
        .QN(n2683) );
  DFFRX1 STRING_reg_5__5_ ( .D(n1157), .CK(clk), .RN(n2829), .Q(STRING[221]), 
        .QN(n2800) );
  DFFRX1 STRING_reg_30__3_ ( .D(n955), .CK(clk), .RN(n2829), .Q(STRING[27]), 
        .QN(n2590) );
  DFFRX1 STRING_reg_30__0_ ( .D(n960), .CK(clk), .RN(n2831), .Q(STRING[24]), 
        .QN(n2631) );
  DFFRX1 STRING_reg_11__5_ ( .D(n1109), .CK(clk), .RN(n2829), .Q(STRING[179])
         );
  DFFRX1 STRING_reg_30__5_ ( .D(n957), .CK(clk), .RN(n2829), .Q(STRING[29]), 
        .QN(n2774) );
  DFFRX1 STRING_reg_8__5_ ( .D(n1133), .CK(clk), .RN(n2827), .Q(STRING[203])
         );
  DFFRX1 PATTERN_reg_2__2_ ( .D(n877), .CK(clk), .RN(n1222), .Q(PATTERN[42]), 
        .QN(n2621) );
  DFFRX1 PATTERN_reg_6__0_ ( .D(n915), .CK(clk), .RN(n1222), .Q(PATTERN[8]), 
        .QN(n2723) );
  DFFRX1 STRING_reg_9__5_ ( .D(n1125), .CK(clk), .RN(n1222), .Q(STRING[195])
         );
  DFFRX1 PATTERN_reg_4__6_ ( .D(n897), .CK(clk), .RN(n2828), .Q(PATTERN[30]), 
        .QN(n2708) );
  DFFRX1 STRING_reg_14__7_ ( .D(n1087), .CK(clk), .RN(n2826), .QN(n2591) );
  DFFRX1 STRING_reg_22__5_ ( .D(n1021), .CK(clk), .RN(n2828), .Q(STRING[93]), 
        .QN(n2664) );
  DFFRX1 STRING_reg_12__7_ ( .D(n1103), .CK(clk), .RN(n2826), .Q(STRING[173]), 
        .QN(n2658) );
  DFFRX1 STRING_reg_12__4_ ( .D(n1100), .CK(clk), .RN(n2829), .Q(STRING[170]), 
        .QN(n2594) );
  DFFRX1 STRING_reg_20__3_ ( .D(n1035), .CK(clk), .RN(n2044), .Q(STRING[107]), 
        .QN(n2721) );
  DFFRX1 PATTERN_reg_0__6_ ( .D(n865), .CK(clk), .RN(n2827), .QN(n2716) );
  DFFRX1 STRING_reg_20__0_ ( .D(n1040), .CK(clk), .RN(n2829), .Q(STRING[104]), 
        .QN(n2630) );
  DFFRX1 PATTERN_reg_1__2_ ( .D(n869), .CK(clk), .RN(n2823), .Q(PATTERN[50]), 
        .QN(n2711) );
  DFFRX1 PATTERN_reg_5__0_ ( .D(n907), .CK(clk), .RN(n1222), .Q(PATTERN[16]), 
        .QN(n2626) );
  DFFRX1 STRING_reg_29__3_ ( .D(n963), .CK(clk), .RN(n2829), .Q(STRING[35]), 
        .QN(n2627) );
  DFFRX1 STRING_reg_29__0_ ( .D(n968), .CK(clk), .RN(n2831), .Q(STRING[32]), 
        .QN(n2717) );
  DFFRX1 STRING_reg_12__6_ ( .D(n1102), .CK(clk), .RN(n2829), .Q(STRING[172]), 
        .QN(n2603) );
  DFFRX1 STRING_reg_21__3_ ( .D(n1027), .CK(clk), .RN(n2044), .Q(STRING[99]), 
        .QN(n2709) );
  DFFRX1 STRING_reg_21__0_ ( .D(n1032), .CK(clk), .RN(n2830), .Q(STRING[96]), 
        .QN(n2619) );
  DFFRX1 STRING_reg_12__2_ ( .D(n1098), .CK(clk), .RN(n2044), .Q(STRING[168]), 
        .QN(n2752) );
  DFFRX1 STRING_reg_12__1_ ( .D(n1097), .CK(clk), .RN(n2823), .Q(STRING[167]), 
        .QN(n2678) );
  DFFRX1 STRING_reg_31__3_ ( .D(n947), .CK(clk), .RN(n2829), .Q(STRING[19]), 
        .QN(n2713) );
  DFFRX1 STRING_reg_22__3_ ( .D(n1019), .CK(clk), .RN(n2044), .Q(STRING[91]), 
        .QN(n2617) );
  DFFRX1 PATTERN_reg_4__1_ ( .D(n892), .CK(clk), .RN(n2824), .Q(PATTERN[25]), 
        .QN(n2624) );
  DFFRX1 STRING_reg_31__0_ ( .D(n952), .CK(clk), .RN(n2831), .Q(STRING[16]), 
        .QN(n2625) );
  DFFRX1 STRING_reg_23__3_ ( .D(n1011), .CK(clk), .RN(n2044), .Q(STRING[83]), 
        .QN(n2616) );
  DFFRX1 STRING_reg_22__0_ ( .D(n1024), .CK(clk), .RN(n2830), .Q(STRING[88]), 
        .QN(n2722) );
  DFFRX1 STRING_reg_23__0_ ( .D(n1016), .CK(clk), .RN(n2830), .Q(STRING[80]), 
        .QN(n2707) );
  DFFRX1 PATTERN_reg_4__5_ ( .D(n896), .CK(clk), .RN(n2824), .Q(PATTERN[29]), 
        .QN(n2623) );
  DFFRX1 PATTERN_reg_4__3_ ( .D(n894), .CK(clk), .RN(n2827), .Q(PATTERN[27]), 
        .QN(n2622) );
  DFFRX1 STRING_reg_12__0_ ( .D(n1104), .CK(clk), .RN(n2832), .Q(STRING[166]), 
        .QN(n2595) );
  DFFRX1 STRING_reg_12__3_ ( .D(n1099), .CK(clk), .RN(n2829), .Q(STRING[169]), 
        .QN(n2645) );
  DFFRX1 PATTERN_reg_6__3_ ( .D(n910), .CK(clk), .RN(n2829), .Q(PATTERN[11]), 
        .QN(n2710) );
  DFFRX1 STRING_reg_2__3_ ( .D(n1179), .CK(clk), .RN(n2829), .Q(STRING[241]), 
        .QN(n2802) );
  DFFRX1 STRING_reg_4__3_ ( .D(n1163), .CK(clk), .RN(n2829), .QN(n2724) );
  DFFRX1 STRING_reg_4__0_ ( .D(n1168), .CK(clk), .RN(n2831), .QN(n2632) );
  DFFRX1 STRING_reg_2__6_ ( .D(n1182), .CK(clk), .RN(n2830), .Q(STRING[244]), 
        .QN(n2811) );
  DFFRX1 PATTERN_reg_6__7_ ( .D(n914), .CK(clk), .RN(n2829), .Q(PATTERN[15]), 
        .QN(n2706) );
  DFFRX1 STRING_reg_5__3_ ( .D(n1155), .CK(clk), .RN(n2829), .QN(n2629) );
  DFFRX1 STRING_reg_2__2_ ( .D(n1178), .CK(clk), .RN(n1222), .Q(STRING[240]), 
        .QN(n2807) );
  DFFRX1 PATTERN_reg_2__0_ ( .D(n883), .CK(clk), .RN(n2827), .Q(PATTERN[40]), 
        .QN(n2702) );
  DFFRX1 STRING_reg_2__4_ ( .D(n1180), .CK(clk), .RN(n2828), .Q(STRING[242]), 
        .QN(n2812) );
  DFFRX1 STRING_reg_5__0_ ( .D(n1160), .CK(clk), .RN(n2831), .QN(n2720) );
  DFFRX1 STRING_reg_3__1_ ( .D(n1169), .CK(clk), .RN(n2822), .Q(STRING[231]), 
        .QN(n2810) );
  DFFRX1 STRING_reg_3__3_ ( .D(n1171), .CK(clk), .RN(n2829), .Q(STRING[233]), 
        .QN(n2801) );
  DFFRX1 PATTERN_reg_1__7_ ( .D(n874), .CK(clk), .RN(n2829), .Q(PATTERN[55]), 
        .QN(n2705) );
  DFFRX1 PATTERN_reg_1__1_ ( .D(n868), .CK(clk), .RN(n2824), .Q(PATTERN[49]), 
        .QN(n2614) );
  DFFRX1 PATTERN_reg_1__5_ ( .D(n872), .CK(clk), .RN(n2824), .Q(PATTERN[53]), 
        .QN(n2615) );
  DFFRX1 PATTERN_reg_0__1_ ( .D(n860), .CK(clk), .RN(n2824), .QN(n2719) );
  DFFRX1 STRING_reg_7__3_ ( .D(n1139), .CK(clk), .RN(n2829), .QN(n2718) );
  DFFRX1 STRING_reg_7__0_ ( .D(n1144), .CK(clk), .RN(n2832), .QN(n2628) );
  DFFRX1 PATTERN_reg_5__3_ ( .D(n902), .CK(clk), .RN(n2829), .Q(PATTERN[19]), 
        .QN(n2726) );
  DFFRX1 STRING_reg_24__1_ ( .D(n1001), .CK(clk), .RN(n1222), .Q(STRING[73])
         );
  DFFRX1 STRING_reg_24__3_ ( .D(n1003), .CK(clk), .RN(n2829), .Q(STRING[75])
         );
  DFFRX1 PATTERN_reg_5__5_ ( .D(n904), .CK(clk), .RN(n2824), .Q(PATTERN[21]), 
        .QN(n2728) );
  DFFRX1 STRING_reg_6__0_ ( .D(n1152), .CK(clk), .RN(n2831), .QN(n2725) );
  DFFRX1 STRING_reg_13__7_ ( .D(n1095), .CK(clk), .RN(n2826), .Q(STRING[165]), 
        .QN(n2596) );
  DFFRX1 STRING_reg_2__0_ ( .D(n1184), .CK(clk), .RN(n2831), .Q(STRING[238]), 
        .QN(n2805) );
  DFFRX1 PATTERN_reg_1__3_ ( .D(n870), .CK(clk), .RN(n2829), .Q(PATTERN[51]), 
        .QN(n2613) );
  DFFRX1 STRING_reg_2__7_ ( .D(n1183), .CK(clk), .RN(n2044), .Q(STRING[245]), 
        .QN(n2700) );
  DFFRX1 STRING_reg_3__6_ ( .D(n1174), .CK(clk), .RN(n2832), .Q(STRING[236]), 
        .QN(n2808) );
  DFFRX2 STRING_reg_30__2_ ( .D(n954), .CK(clk), .RN(n2044), .Q(STRING[26]), 
        .QN(n2588) );
  DFFRX1 STRING_reg_13__4_ ( .D(n1092), .CK(clk), .RN(n2829), .Q(STRING[162]), 
        .QN(n2592) );
  DFFRX2 STRING_reg_20__6_ ( .D(n1038), .CK(clk), .RN(n2828), .Q(STRING[110]), 
        .QN(n2772) );
  DFFRX2 STRING_reg_20__4_ ( .D(n1036), .CK(clk), .RN(n2827), .Q(STRING[108]), 
        .QN(n2775) );
  DFFRX2 STRING_reg_22__6_ ( .D(n1022), .CK(clk), .RN(n2832), .Q(STRING[94]), 
        .QN(n2686) );
  DFFRX2 STRING_reg_22__4_ ( .D(n1020), .CK(clk), .RN(n2827), .Q(STRING[92]), 
        .QN(n2687) );
  DFFRX2 STRING_reg_30__7_ ( .D(n959), .CK(clk), .RN(n2044), .Q(STRING[31]), 
        .QN(n2600) );
  DFFRX2 STRING_reg_28__1_ ( .D(n969), .CK(clk), .RN(n2822), .Q(STRING[41]), 
        .QN(n2769) );
  DFFRX2 STRING_reg_28__2_ ( .D(n970), .CK(clk), .RN(n2044), .Q(STRING[42]), 
        .QN(n2605) );
  DFFRX2 STRING_reg_23__2_ ( .D(n1010), .CK(clk), .RN(n2044), .Q(STRING[82]), 
        .QN(n2597) );
  DFFRX2 match_index_reg_2_ ( .D(N774), .CK(clk), .RN(n2825), .Q(n2836) );
  DFFRX2 pat_count_reg_1_ ( .D(n927), .CK(clk), .RN(n2827), .Q(pat_count[1]), 
        .QN(n2693) );
  DFFRX2 state_reg_0_ ( .D(next_state[0]), .CK(clk), .RN(n2825), .Q(state[0])
         );
  DFFRX4 str_start_idx_reg_4_ ( .D(n854), .CK(clk), .RN(n2828), .Q(
        str_start_idx[4]), .QN(n2618) );
  DFFRX2 pat_count_reg_0_ ( .D(n926), .CK(clk), .RN(n2827), .Q(pat_count[0]), 
        .QN(n2784) );
  DFFRX4 str_count_reg_2_ ( .D(n1204), .CK(clk), .RN(n2828), .Q(str_count[2]), 
        .QN(n2786) );
  DFFRX2 match_index_reg_1_ ( .D(N773), .CK(clk), .RN(n2825), .Q(n2837) );
  DFFRX2 match_index_reg_4_ ( .D(N776), .CK(clk), .RN(n2827), .Q(n2834) );
  DFFRX2 is_check_point_match_reg ( .D(N617), .CK(clk), .RN(n2825), .Q(
        is_check_point_match), .QN(n2694) );
  DFFSX1 valid_reg ( .D(n2586), .CK(clk), .SN(n2827), .QN(n2839) );
  DFFRX1 STRING_reg_16__6_ ( .D(n1070), .CK(clk), .RN(n2827), .Q(STRING[142])
         );
  DFFSX4 isstring_reg_reg ( .D(n2585), .CK(clk), .SN(n2829), .Q(n2697), .QN(
        isstring_reg) );
  DFFRX1 STRING_reg_15__7_ ( .D(n1079), .CK(clk), .RN(n2826), .Q(STRING[151]), 
        .QN(n2656) );
  DFFRX2 PATTERN_reg_5__4_ ( .D(n903), .CK(clk), .RN(n2044), .Q(PATTERN[20]), 
        .QN(n2727) );
  DFFRHQX2 match_index_reg_3_ ( .D(N775), .CK(clk), .RN(n2825), .Q(n2835) );
  DFFRX1 STRING_reg_31__2_ ( .D(n946), .CK(clk), .RN(n2044), .Q(STRING[18]), 
        .QN(n2587) );
  DFFRX1 STRING_reg_3__7_ ( .D(n1175), .CK(clk), .RN(n2044), .Q(STRING[237]), 
        .QN(n2699) );
  DFFRX1 STRING_reg_8__0_ ( .D(n1136), .CK(clk), .RN(n2832), .Q(STRING[198])
         );
  DFFRX1 STRING_reg_18__7_ ( .D(n1055), .CK(clk), .RN(n2822), .Q(STRING[127])
         );
  DFFRX1 STRING_reg_27__6_ ( .D(n982), .CK(clk), .RN(n2829), .Q(STRING[54]) );
  DFFRX1 STRING_reg_15__4_ ( .D(n1076), .CK(clk), .RN(n2829), .Q(STRING[148]), 
        .QN(n2644) );
  DFFRX1 STRING_reg_28__3_ ( .D(n971), .CK(clk), .RN(n2828), .Q(STRING[43]), 
        .QN(n2757) );
  DFFRX1 STRING_reg_10__1_ ( .D(n1113), .CK(clk), .RN(n2823), .Q(STRING[183])
         );
  DFFRX1 STRING_reg_27__1_ ( .D(n977), .CK(clk), .RN(n2822), .Q(STRING[49]) );
  DFFRX1 PATTERN_reg_6__5_ ( .D(n912), .CK(clk), .RN(n2824), .Q(PATTERN[13])
         );
  DFFRX1 PATTERN_reg_6__1_ ( .D(n908), .CK(clk), .RN(n2044), .Q(PATTERN[9]), 
        .QN(n2712) );
  DFFRX1 PATTERN_reg_0__5_ ( .D(n864), .CK(clk), .RN(n2822), .QN(n2715) );
  DFFRX1 STRING_reg_31__7_ ( .D(n951), .CK(clk), .RN(n2044), .Q(STRING[23]), 
        .QN(n2598) );
  DFFRX1 STRING_reg_2__5_ ( .D(n1181), .CK(clk), .RN(n2825), .Q(STRING[243]), 
        .QN(n2731) );
  DFFRX1 STRING_reg_31__1_ ( .D(n945), .CK(clk), .RN(n2822), .Q(STRING[17]), 
        .QN(n2680) );
  DFFRX1 STRING_reg_29__1_ ( .D(n961), .CK(clk), .RN(n2822), .Q(STRING[33]), 
        .QN(n2766) );
  DFFRX1 STRING_reg_22__2_ ( .D(n1018), .CK(clk), .RN(n2044), .Q(STRING[90]), 
        .QN(n2599) );
  DFFRX1 PATTERN_reg_1__4_ ( .D(n871), .CK(clk), .RN(n1222), .Q(PATTERN[52]), 
        .QN(n2634) );
  DFFRX1 STRING_reg_28__7_ ( .D(n975), .CK(clk), .RN(n2044), .Q(STRING[47]), 
        .QN(n2671) );
  DFFRX2 STRING_reg_30__1_ ( .D(n953), .CK(clk), .RN(n2822), .Q(STRING[25]), 
        .QN(n2682) );
  DFFRX2 STRING_reg_21__2_ ( .D(n1026), .CK(clk), .RN(n2822), .Q(STRING[98]), 
        .QN(n2665) );
  DFFRX2 STRING_reg_29__7_ ( .D(n967), .CK(clk), .RN(n2044), .Q(STRING[39]), 
        .QN(n2666) );
  DFFRX2 STRING_reg_29__2_ ( .D(n962), .CK(clk), .RN(n2044), .Q(STRING[34]), 
        .QN(n2604) );
  DFFRX2 str_count_reg_0_ ( .D(n1205), .CK(clk), .RN(n2828), .Q(str_count[0]), 
        .QN(n2779) );
  DFFRX1 STRING_reg_22__7_ ( .D(n1023), .CK(clk), .RN(n2824), .Q(STRING[95]), 
        .QN(n2655) );
  DFFRX1 STRING_reg_14__1_ ( .D(n1081), .CK(clk), .RN(n2823), .Q(STRING[153]), 
        .QN(n2762) );
  DFFRX1 STRING_reg_31__6_ ( .D(n950), .CK(clk), .RN(n2831), .Q(STRING[22]), 
        .QN(n2675) );
  DFFRX1 STRING_reg_23__6_ ( .D(n1014), .CK(clk), .RN(n2832), .Q(STRING[86]), 
        .QN(n2667) );
  DFFRX1 PATTERN_reg_4__0_ ( .D(n899), .CK(clk), .RN(n1222), .Q(PATTERN[24])
         );
  DFFRX1 STRING_reg_7__7_ ( .D(n1143), .CK(clk), .RN(n2826), .Q(STRING[211]), 
        .QN(n2640) );
  DFFRX1 STRING_reg_6__7_ ( .D(n1151), .CK(clk), .RN(n2826), .Q(STRING[217]), 
        .QN(n2641) );
  DFFRX1 STRING_reg_21__4_ ( .D(n1028), .CK(clk), .RN(n2827), .Q(STRING[100]), 
        .QN(n2765) );
  DFFRX1 PATTERN_reg_4__2_ ( .D(n893), .CK(clk), .RN(n2044), .Q(PATTERN[26])
         );
  DFFRX1 STRING_reg_21__6_ ( .D(n1030), .CK(clk), .RN(n2828), .Q(STRING[102]), 
        .QN(n2759) );
  DFFRX1 STRING_reg_17__6_ ( .D(n1062), .CK(clk), .RN(n2831), .Q(STRING[134])
         );
  DFFRX1 STRING_reg_25__1_ ( .D(n993), .CK(clk), .RN(n2822), .Q(STRING[65]) );
  DFFRX1 STRING_reg_15__2_ ( .D(n1074), .CK(clk), .RN(n2044), .Q(STRING[146]), 
        .QN(n2749) );
  DFFRX1 STRING_reg_9__0_ ( .D(n1128), .CK(clk), .RN(n2832), .Q(STRING[190])
         );
  DFFRX1 STRING_reg_9__7_ ( .D(n1127), .CK(clk), .RN(n2826), .Q(STRING[197])
         );
  DFFRX1 STRING_reg_10__0_ ( .D(n1120), .CK(clk), .RN(n2832), .Q(STRING[182]), 
        .QN(n1364) );
  DFFRX1 STRING_reg_18__6_ ( .D(n1054), .CK(clk), .RN(n2832), .Q(STRING[126])
         );
  DFFRX1 STRING_reg_19__0_ ( .D(n1048), .CK(clk), .RN(n2830), .Q(STRING[112])
         );
  DFFRX1 STRING_reg_19__7_ ( .D(n1047), .CK(clk), .RN(n2825), .Q(STRING[119])
         );
  DFFRX1 STRING_reg_11__2_ ( .D(n1106), .CK(clk), .RN(n2831), .Q(STRING[176])
         );
  DFFRX1 STRING_reg_16__0_ ( .D(n1072), .CK(clk), .RN(n2830), .Q(STRING[136])
         );
  DFFRX1 STRING_reg_16__7_ ( .D(n1071), .CK(clk), .RN(n2823), .Q(STRING[143])
         );
  DFFRX1 STRING_reg_18__0_ ( .D(n1056), .CK(clk), .RN(n2830), .Q(STRING[120])
         );
  DFFRX1 STRING_reg_24__0_ ( .D(n1008), .CK(clk), .RN(n2830), .Q(STRING[72])
         );
  DFFRX1 STRING_reg_26__0_ ( .D(n992), .CK(clk), .RN(n2830), .Q(STRING[56]) );
  DFFRX1 STRING_reg_27__0_ ( .D(n984), .CK(clk), .RN(n2831), .Q(STRING[48]) );
  DFFRX1 STRING_reg_8__7_ ( .D(n1135), .CK(clk), .RN(n2826), .Q(STRING[205])
         );
  DFFRX1 STRING_reg_28__0_ ( .D(n976), .CK(clk), .RN(n2831), .Q(STRING[40]), 
        .QN(n2761) );
  DFFRX1 STRING_reg_14__6_ ( .D(n1086), .CK(clk), .RN(n2829), .Q(STRING[157]), 
        .QN(n2676) );
  DFFRX1 STRING_reg_14__4_ ( .D(n1084), .CK(clk), .RN(n2829), .Q(STRING[155]), 
        .QN(n2648) );
  DFFRX1 STRING_reg_3__4_ ( .D(n1172), .CK(clk), .RN(n2828), .Q(STRING[234]), 
        .QN(n2809) );
  DFFRX1 STRING_reg_13__0_ ( .D(n1096), .CK(clk), .RN(n2832), .Q(STRING[158]), 
        .QN(n2593) );
  DFFRX1 STRING_reg_4__6_ ( .D(n1166), .CK(clk), .RN(n2828), .Q(STRING[228]), 
        .QN(n2745) );
  DFFRX1 STRING_reg_27__4_ ( .D(n980), .CK(clk), .RN(n2828), .Q(STRING[52]) );
  DFFRX1 STRING_reg_17__1_ ( .D(n1057), .CK(clk), .RN(n1222), .Q(STRING[129])
         );
  DFFRX1 STRING_reg_18__1_ ( .D(n1049), .CK(clk), .RN(n1222), .Q(STRING[121])
         );
  DFFRX1 STRING_reg_18__4_ ( .D(n1052), .CK(clk), .RN(n2827), .Q(STRING[124]), 
        .QN(n1365) );
  DFFRX1 STRING_reg_4__4_ ( .D(n1164), .CK(clk), .RN(n2828), .Q(STRING[226]), 
        .QN(n2751) );
  DFFRX1 STRING_reg_25__4_ ( .D(n996), .CK(clk), .RN(n2828), .Q(STRING[68]) );
  DFFRX1 STRING_reg_17__4_ ( .D(n1060), .CK(clk), .RN(n2827), .Q(STRING[132])
         );
  DFFRX1 STRING_reg_10__2_ ( .D(n1114), .CK(clk), .RN(n1222), .Q(STRING[184])
         );
  DFFRX1 STRING_reg_9__2_ ( .D(n1122), .CK(clk), .RN(n2827), .Q(STRING[192])
         );
  DFFRX1 STRING_reg_16__1_ ( .D(n1065), .CK(clk), .RN(n1222), .Q(STRING[137])
         );
  DFFRX1 STRING_reg_21__1_ ( .D(n1025), .CK(clk), .RN(n1222), .Q(STRING[97]), 
        .QN(n2760) );
  DFFRX1 STRING_reg_20__1_ ( .D(n1033), .CK(clk), .RN(n1222), .Q(STRING[105]), 
        .QN(n2773) );
  DFFRX1 STRING_reg_24__4_ ( .D(n1004), .CK(clk), .RN(n2827), .Q(STRING[76])
         );
  DFFRX1 STRING_reg_29__4_ ( .D(n964), .CK(clk), .RN(n2828), .Q(STRING[36]), 
        .QN(n2770) );
  DFFRX1 STRING_reg_16__3_ ( .D(n1067), .CK(clk), .RN(n2044), .Q(STRING[139])
         );
  DFFRX1 STRING_reg_18__3_ ( .D(n1051), .CK(clk), .RN(n2044), .Q(STRING[123])
         );
  DFFRX1 STRING_reg_10__4_ ( .D(n1116), .CK(clk), .RN(n2829), .Q(STRING[186])
         );
  DFFRX1 STRING_reg_24__7_ ( .D(n1007), .CK(clk), .RN(n2044), .Q(STRING[79])
         );
  DFFRX1 STRING_reg_26__7_ ( .D(n991), .CK(clk), .RN(n2044), .Q(STRING[63]) );
  DFFRX1 STRING_reg_27__7_ ( .D(n983), .CK(clk), .RN(n2044), .Q(STRING[55]) );
  DFFRX1 STRING_reg_24__2_ ( .D(n1002), .CK(clk), .RN(n2044), .Q(STRING[74])
         );
  DFFRX1 STRING_reg_26__2_ ( .D(n986), .CK(clk), .RN(n2044), .Q(STRING[58]) );
  DFFRX1 STRING_reg_27__2_ ( .D(n978), .CK(clk), .RN(n2044), .Q(STRING[50]) );
  DFFRX1 STRING_reg_19__3_ ( .D(n1043), .CK(clk), .RN(n2044), .Q(STRING[115])
         );
  DFFRX1 STRING_reg_20__2_ ( .D(n1034), .CK(clk), .RN(n2829), .Q(STRING[106]), 
        .QN(n2669) );
  DFFRX1 STRING_reg_5__4_ ( .D(n1156), .CK(clk), .RN(n2829), .Q(STRING[220]), 
        .QN(n2750) );
  DFFRX1 STRING_reg_7__4_ ( .D(n1140), .CK(clk), .RN(n2829), .Q(STRING[208]), 
        .QN(n2660) );
  DFFRX1 STRING_reg_1__6_ ( .D(n1190), .CK(clk), .RN(n2829), .Q(STRING[252])
         );
  DFFRX1 STRING_reg_8__3_ ( .D(n1131), .CK(clk), .RN(n2829), .Q(STRING[201])
         );
  DFFRX1 STRING_reg_9__3_ ( .D(n1123), .CK(clk), .RN(n2829), .Q(STRING[193])
         );
  DFFRX1 STRING_reg_18__2_ ( .D(n1050), .CK(clk), .RN(n2829), .Q(STRING[122])
         );
  DFFRX1 STRING_reg_19__2_ ( .D(n1042), .CK(clk), .RN(n2829), .Q(STRING[114])
         );
  DFFRX1 STRING_reg_11__3_ ( .D(n1107), .CK(clk), .RN(n2829), .Q(STRING[177])
         );
  DFFRX1 STRING_reg_10__3_ ( .D(n1115), .CK(clk), .RN(n2829), .Q(STRING[185])
         );
  DFFRX1 STRING_reg_20__5_ ( .D(n1037), .CK(clk), .RN(n2044), .Q(STRING[109]), 
        .QN(n2755) );
  DFFRX1 PATTERN_reg_1__0_ ( .D(n875), .CK(clk), .RN(n1222), .Q(PATTERN[48]), 
        .QN(n2703) );
  DFFRX1 match_reg ( .D(N699), .CK(clk), .RN(n2827), .Q(n2833) );
  DFFRX1 STRING_reg_13__2_ ( .D(n1090), .CK(clk), .RN(n2044), .Q(STRING[160]), 
        .QN(n2662) );
  DFFRX1 STRING_reg_16__2_ ( .D(n1066), .CK(clk), .RN(n2829), .Q(STRING[138])
         );
  DFFRX1 STRING_reg_27__3_ ( .D(n979), .CK(clk), .RN(n2829), .Q(STRING[51]) );
  DFFRX1 STRING_reg_8__2_ ( .D(n1130), .CK(clk), .RN(n2829), .Q(STRING[200])
         );
  DFFRX1 STRING_reg_6__3_ ( .D(n1147), .CK(clk), .RN(n2829), .QN(n1368) );
  DFFRX1 STRING_reg_14__2_ ( .D(n1082), .CK(clk), .RN(n2044), .QN(n2633) );
  DFFRX1 STRING_reg_13__6_ ( .D(n1094), .CK(clk), .RN(n2829), .Q(STRING[164]), 
        .QN(n2601) );
  DFFRX1 STRING_reg_15__6_ ( .D(n1078), .CK(clk), .RN(n2829), .Q(STRING[150]), 
        .QN(n2663) );
  DFFRX1 STRING_reg_13__3_ ( .D(n1091), .CK(clk), .RN(n2829), .Q(STRING[161]), 
        .QN(n2642) );
  DFFRX1 PATTERN_reg_0__3_ ( .D(n862), .CK(clk), .RN(n2044), .QN(n2714) );
  OAI2BB1X1 U1224 ( .A0N(PATTERN[39]), .A1N(n2344), .B0(n2332), .Y(n890) );
  OAI2BB1X1 U1225 ( .A0N(PATTERN[15]), .A1N(n2298), .B0(n2295), .Y(n914) );
  OAI2BB1X1 U1226 ( .A0N(PATTERN[36]), .A1N(n2344), .B0(n2340), .Y(n887) );
  OAI2BB1X1 U1227 ( .A0N(PATTERN[38]), .A1N(n2344), .B0(n2338), .Y(n889) );
  OAI2BB1X1 U1228 ( .A0N(PATTERN[37]), .A1N(n2344), .B0(n2320), .Y(n888) );
  OAI2BB1X1 U1229 ( .A0N(PATTERN[32]), .A1N(n2344), .B0(n2326), .Y(n891) );
  OAI2BB1X1 U1230 ( .A0N(PATTERN[34]), .A1N(n2344), .B0(n2329), .Y(n885) );
  OAI2BB1X1 U1231 ( .A0N(PATTERN[8]), .A1N(n2298), .B0(n2294), .Y(n915) );
  OAI2BB1X1 U1232 ( .A0N(PATTERN[11]), .A1N(n2298), .B0(n2297), .Y(n910) );
  OAI2BB1X1 U1233 ( .A0N(STRING[149]), .A1N(n2451), .B0(n2450), .Y(n1077) );
  OAI2BB1X1 U1234 ( .A0N(STRING[171]), .A1N(n2460), .B0(n2459), .Y(n1101) );
  OAI2BB1X1 U1235 ( .A0N(PATTERN[55]), .A1N(n2351), .B0(n2333), .Y(n874) );
  OAI2BB1X1 U1236 ( .A0N(PATTERN[53]), .A1N(n2351), .B0(n2350), .Y(n872) );
  OAI2BB1X1 U1237 ( .A0N(PATTERN[49]), .A1N(n2351), .B0(n2345), .Y(n868) );
  OAI2BB1X1 U1238 ( .A0N(PATTERN[51]), .A1N(n2351), .B0(n2335), .Y(n870) );
  AOI21X2 U1239 ( .A0(n2029), .A1(n2028), .B0(n2586), .Y(N774) );
  OAI21X1 U1240 ( .A0(n1218), .A1(n2478), .B0(n2474), .Y(n965) );
  MXI2X1 U1241 ( .A(n2415), .B(n2676), .S0(n2457), .Y(n1086) );
  MXI2X1 U1242 ( .A(n2425), .B(n2650), .S0(n2457), .Y(n1088) );
  MXI2X1 U1243 ( .A(n2408), .B(n2633), .S0(n2457), .Y(n1082) );
  MXI2X1 U1244 ( .A(n2436), .B(n2648), .S0(n2457), .Y(n1084) );
  MXI2X1 U1245 ( .A(n2399), .B(n2738), .S0(n2457), .Y(n1083) );
  MXI2X1 U1246 ( .A(n2388), .B(n2762), .S0(n2457), .Y(n1081) );
  OAI21X1 U1247 ( .A0(n2445), .A1(n2447), .B0(n2444), .Y(n1015) );
  MXI2X1 U1248 ( .A(n2415), .B(n2663), .S0(n2451), .Y(n1078) );
  MXI2X1 U1249 ( .A(n2415), .B(n2601), .S0(n2454), .Y(n1094) );
  MXI2X1 U1250 ( .A(n2388), .B(n2758), .S0(n2451), .Y(n1073) );
  MXI2X1 U1251 ( .A(n2388), .B(n2673), .S0(n2454), .Y(n1089) );
  MXI2X1 U1252 ( .A(n2408), .B(n2749), .S0(n2451), .Y(n1074) );
  MXI2X1 U1253 ( .A(n2408), .B(n2662), .S0(n2454), .Y(n1090) );
  MXI2X1 U1254 ( .A(n2399), .B(n2736), .S0(n2451), .Y(n1075) );
  MXI2X1 U1255 ( .A(n2399), .B(n2642), .S0(n2454), .Y(n1091) );
  MXI2X1 U1256 ( .A(n2425), .B(n2647), .S0(n2451), .Y(n1080) );
  MXI2X1 U1257 ( .A(n2425), .B(n2593), .S0(n2454), .Y(n1096) );
  OAI21X1 U1258 ( .A0(n1218), .A1(n2399), .B0(n2394), .Y(n963) );
  OAI21X1 U1259 ( .A0(n1218), .A1(n2425), .B0(n2421), .Y(n968) );
  MXI2X1 U1260 ( .A(n2447), .B(n2591), .S0(n2457), .Y(n1087) );
  OAI21XL U1261 ( .A0(n1217), .A1(n2447), .B0(n2443), .Y(n975) );
  OAI21XL U1262 ( .A0(n1216), .A1(n2388), .B0(n2381), .Y(n953) );
  OAI21XL U1263 ( .A0(n1219), .A1(n2388), .B0(n2379), .Y(n945) );
  OAI21XL U1264 ( .A0(n1218), .A1(n2447), .B0(n2442), .Y(n967) );
  OAI21XL U1265 ( .A0(n1218), .A1(n2408), .B0(n2405), .Y(n962) );
  MXI2X1 U1266 ( .A(n2425), .B(n2595), .S0(n2460), .Y(n1104) );
  MXI2X1 U1267 ( .A(n2415), .B(n2603), .S0(n2460), .Y(n1102) );
  MXI2X1 U1268 ( .A(n2447), .B(n2658), .S0(n2460), .Y(n1103) );
  MXI2X1 U1269 ( .A(n2436), .B(n2644), .S0(n2451), .Y(n1076) );
  MXI2X1 U1270 ( .A(n2436), .B(n2592), .S0(n2454), .Y(n1092) );
  MXI2X1 U1271 ( .A(n2436), .B(n2594), .S0(n2460), .Y(n1100) );
  MXI2X1 U1272 ( .A(n2388), .B(n2678), .S0(n2460), .Y(n1097) );
  MXI2X1 U1273 ( .A(n2408), .B(n2752), .S0(n2460), .Y(n1098) );
  MXI2X1 U1274 ( .A(n2399), .B(n2645), .S0(n2460), .Y(n1099) );
  OAI21XL U1275 ( .A0(n1219), .A1(n2478), .B0(n2473), .Y(n949) );
  OAI21XL U1276 ( .A0(n1377), .A1(n2478), .B0(n2481), .Y(n1005) );
  OAI21XL U1277 ( .A0(n1369), .A1(n2478), .B0(n2479), .Y(n997) );
  OAI21XL U1278 ( .A0(n1370), .A1(n2478), .B0(n2477), .Y(n981) );
  OAI21XL U1279 ( .A0(n1215), .A1(n2478), .B0(n2480), .Y(n989) );
  OAI21XL U1280 ( .A0(n1216), .A1(n2478), .B0(n2475), .Y(n957) );
  OAI21XL U1281 ( .A0(n2408), .A1(n2429), .B0(n2401), .Y(n1122) );
  OAI21XL U1282 ( .A0(n1217), .A1(n2478), .B0(n2476), .Y(n973) );
  OAI21XL U1283 ( .A0(n2388), .A1(n2429), .B0(n2371), .Y(n1121) );
  OAI21XL U1284 ( .A0(n2415), .A1(n2427), .B0(n2409), .Y(n1110) );
  OAI21XL U1285 ( .A0(n2436), .A1(n2427), .B0(n2426), .Y(n1108) );
  OAI21XL U1286 ( .A0(n2408), .A1(n2427), .B0(n2400), .Y(n1106) );
  OAI21XL U1287 ( .A0(n2447), .A1(n2427), .B0(n2437), .Y(n1111) );
  OAI21XL U1288 ( .A0(n2415), .A1(n2431), .B0(n2411), .Y(n1118) );
  OAI21XL U1289 ( .A0(n2399), .A1(n2427), .B0(n2389), .Y(n1107) );
  OAI21XL U1290 ( .A0(n2436), .A1(n2431), .B0(n2430), .Y(n1116) );
  OAI21XL U1291 ( .A0(n2408), .A1(n2431), .B0(n2402), .Y(n1114) );
  OAI21XL U1292 ( .A0(n2425), .A1(n2427), .B0(n2416), .Y(n1112) );
  OAI21XL U1293 ( .A0(n2399), .A1(n2431), .B0(n2391), .Y(n1115) );
  OAI21XL U1294 ( .A0(n2425), .A1(n2431), .B0(n2418), .Y(n1120) );
  OAI21XL U1295 ( .A0(n2447), .A1(n2431), .B0(n2439), .Y(n1119) );
  OAI21XL U1296 ( .A0(n2447), .A1(n2429), .B0(n2438), .Y(n1127) );
  OAI21XL U1297 ( .A0(n2436), .A1(n2429), .B0(n2428), .Y(n1124) );
  OAI21XL U1298 ( .A0(n2425), .A1(n2429), .B0(n2417), .Y(n1128) );
  OAI21XL U1299 ( .A0(n2399), .A1(n2429), .B0(n2390), .Y(n1123) );
  OAI21XL U1300 ( .A0(n1216), .A1(n2425), .B0(n2422), .Y(n960) );
  OAI21XL U1301 ( .A0(n1377), .A1(n2388), .B0(n2382), .Y(n1001) );
  OAI21XL U1302 ( .A0(n1219), .A1(n2425), .B0(n2420), .Y(n952) );
  OAI21XL U1303 ( .A0(n1219), .A1(n2399), .B0(n2393), .Y(n947) );
  OAI21XL U1304 ( .A0(n1377), .A1(n2399), .B0(n2396), .Y(n1003) );
  OAI21XL U1305 ( .A0(n2388), .A1(n2431), .B0(n2374), .Y(n1113) );
  OAI21XL U1306 ( .A0(n1219), .A1(n2447), .B0(n2441), .Y(n951) );
  OAI21XL U1307 ( .A0(n1219), .A1(n2408), .B0(n2404), .Y(n946) );
  OAI22X1 U1308 ( .A0(n2436), .A1(n2433), .B0(n2799), .B1(n2469), .Y(n1188) );
  OAI21X1 U1309 ( .A0(n2478), .A1(n2483), .B0(n2482), .Y(n1013) );
  OAI21X1 U1310 ( .A0(n2478), .A1(n2485), .B0(n2484), .Y(n1045) );
  OAI21X1 U1311 ( .A0(n2485), .A1(n2415), .B0(n2414), .Y(n1046) );
  OAI21X1 U1312 ( .A0(n2485), .A1(n2399), .B0(n2397), .Y(n1043) );
  OAI21X1 U1313 ( .A0(n2483), .A1(n2415), .B0(n2413), .Y(n1014) );
  OAI21X1 U1314 ( .A0(n2485), .A1(n2436), .B0(n2435), .Y(n1044) );
  OAI21X1 U1315 ( .A0(n2483), .A1(n2436), .B0(n2434), .Y(n1012) );
  OAI21X1 U1316 ( .A0(n2483), .A1(n2399), .B0(n2398), .Y(n1011) );
  OAI21XL U1317 ( .A0(n2445), .A1(n2388), .B0(n2384), .Y(n1009) );
  OAI21XL U1318 ( .A0(n2448), .A1(n2447), .B0(n2446), .Y(n1047) );
  OAI21XL U1319 ( .A0(n2445), .A1(n2408), .B0(n2406), .Y(n1010) );
  OAI21XL U1320 ( .A0(n2448), .A1(n2425), .B0(n2423), .Y(n1048) );
  OAI21XL U1321 ( .A0(n2448), .A1(n2388), .B0(n2387), .Y(n1041) );
  OAI21XL U1322 ( .A0(n2448), .A1(n2408), .B0(n2407), .Y(n1042) );
  OAI21XL U1323 ( .A0(n2445), .A1(n2425), .B0(n2424), .Y(n1016) );
  NAND2XL U1324 ( .A(n2429), .B(STRING[190]), .Y(n2417) );
  NAND2XL U1325 ( .A(n2429), .B(STRING[194]), .Y(n2428) );
  NAND2XL U1326 ( .A(n2429), .B(STRING[197]), .Y(n2438) );
  NAND2XL U1327 ( .A(STRING[246]), .B(n2472), .Y(n2419) );
  NAND2XL U1328 ( .A(STRING[253]), .B(n2472), .Y(n2440) );
  NAND2XL U1329 ( .A(STRING[247]), .B(n2472), .Y(n2378) );
  NAND2XL U1330 ( .A(n2431), .B(STRING[183]), .Y(n2374) );
  NAND2XL U1331 ( .A(n1216), .B(STRING[29]), .Y(n2475) );
  NAND2XL U1332 ( .A(n1377), .B(STRING[77]), .Y(n2481) );
  NAND2XL U1333 ( .A(n1377), .B(STRING[73]), .Y(n2382) );
  NAND2XL U1334 ( .A(n1370), .B(STRING[53]), .Y(n2477) );
  NAND2XL U1335 ( .A(n1215), .B(STRING[61]), .Y(n2480) );
  NAND2XL U1336 ( .A(n2427), .B(STRING[175]), .Y(n2369) );
  CLKINVX1 U1337 ( .A(n2117), .Y(n2303) );
  INVX6 U1338 ( .A(n2161), .Y(n2447) );
  NAND2X1 U1339 ( .A(n2485), .B(STRING[117]), .Y(n2484) );
  NAND2XL U1340 ( .A(n2483), .B(STRING[87]), .Y(n2444) );
  NAND2X1 U1341 ( .A(n2470), .B(n2455), .Y(n2456) );
  NAND2X1 U1342 ( .A(n2470), .B(n2464), .Y(n2465) );
  NAND2X1 U1343 ( .A(n2470), .B(n2368), .Y(n2461) );
  NAND2X1 U1344 ( .A(n2470), .B(n2458), .Y(n2459) );
  NAND2X1 U1345 ( .A(n2470), .B(n2452), .Y(n2453) );
  NAND2X1 U1346 ( .A(n2470), .B(n2449), .Y(n2450) );
  NAND2X1 U1347 ( .A(n2560), .B(n2559), .Y(n2569) );
  NAND2X1 U1348 ( .A(n2470), .B(n2469), .Y(n2471) );
  INVX6 U1349 ( .A(n2148), .Y(n2408) );
  NAND2XL U1350 ( .A(n1218), .B(STRING[35]), .Y(n2394) );
  NAND2XL U1351 ( .A(n1218), .B(STRING[32]), .Y(n2421) );
  NAND2XL U1352 ( .A(n1218), .B(STRING[37]), .Y(n2474) );
  NAND2XL U1353 ( .A(n1219), .B(STRING[19]), .Y(n2393) );
  NAND2XL U1354 ( .A(n1216), .B(STRING[24]), .Y(n2422) );
  NAND2XL U1355 ( .A(n1217), .B(STRING[45]), .Y(n2476) );
  NAND2X2 U1356 ( .A(n1223), .B(n1293), .Y(n2316) );
  INVX6 U1357 ( .A(n2157), .Y(n2388) );
  INVX6 U1358 ( .A(n2159), .Y(n2415) );
  NAND2X1 U1359 ( .A(n1216), .B(STRING[27]), .Y(n2395) );
  NAND2X1 U1360 ( .A(n2483), .B(STRING[80]), .Y(n2424) );
  NAND2X1 U1361 ( .A(n2483), .B(STRING[85]), .Y(n2482) );
  NAND2X1 U1362 ( .A(n2483), .B(STRING[83]), .Y(n2398) );
  INVX6 U1363 ( .A(n2150), .Y(n2436) );
  INVX6 U1364 ( .A(n2178), .Y(n2425) );
  INVX6 U1365 ( .A(n2174), .Y(n2399) );
  INVX2 U1366 ( .A(n2348), .Y(n2346) );
  CLKINVX6 U1367 ( .A(n1309), .Y(n1223) );
  INVX1 U1368 ( .A(n2457), .Y(n2455) );
  NOR2X4 U1369 ( .A(n2784), .B(n2290), .Y(n2349) );
  INVX1 U1370 ( .A(n2460), .Y(n2458) );
  INVX1 U1371 ( .A(n2451), .Y(n2449) );
  INVX1 U1372 ( .A(n2454), .Y(n2452) );
  INVX1 U1373 ( .A(n2429), .Y(n2462) );
  BUFX4 U1374 ( .A(n2073), .Y(n2173) );
  NOR2BX1 U1375 ( .AN(n2311), .B(n2358), .Y(n1293) );
  NAND2X4 U1376 ( .A(n2309), .B(n2308), .Y(n2515) );
  INVX3 U1377 ( .A(n2466), .Y(n2468) );
  INVX1 U1378 ( .A(isstring), .Y(n2585) );
  AND2X4 U1379 ( .A(chardata[4]), .B(isstring), .Y(n2150) );
  AND2X4 U1380 ( .A(chardata[1]), .B(isstring), .Y(n2157) );
  AND2X4 U1381 ( .A(chardata[2]), .B(isstring), .Y(n2148) );
  AND2X4 U1382 ( .A(chardata[3]), .B(isstring), .Y(n2174) );
  AND2X4 U1383 ( .A(chardata[0]), .B(isstring), .Y(n2178) );
  AND2X4 U1384 ( .A(chardata[6]), .B(isstring), .Y(n2159) );
  AND2X4 U1385 ( .A(chardata[7]), .B(isstring), .Y(n2161) );
  NAND2X2 U1386 ( .A(n2383), .B(n2372), .Y(n2451) );
  NAND2X6 U1387 ( .A(n2304), .B(n1371), .Y(n1844) );
  NOR2X2 U1388 ( .A(n2244), .B(n2364), .Y(n2466) );
  NAND2BX1 U1389 ( .AN(n2386), .B(n2365), .Y(n2108) );
  NOR2BX1 U1390 ( .AN(n2365), .B(n2375), .Y(n2073) );
  NOR2X6 U1391 ( .A(n2377), .B(n2432), .Y(n2472) );
  NAND2BX1 U1392 ( .AN(n2386), .B(n2366), .Y(n2122) );
  NOR2BX1 U1393 ( .AN(n2385), .B(n2375), .Y(n2063) );
  NOR2BX1 U1394 ( .AN(n2373), .B(n2375), .Y(n2147) );
  NAND2X2 U1395 ( .A(n2243), .B(n2246), .Y(n2276) );
  NAND2X2 U1396 ( .A(n2246), .B(n2245), .Y(n2279) );
  INVX1 U1397 ( .A(n2376), .Y(n2370) );
  NOR2X2 U1398 ( .A(n2263), .B(n2242), .Y(n2246) );
  NOR2X1 U1399 ( .A(n2072), .B(n2786), .Y(n2365) );
  NOR2X2 U1400 ( .A(n2376), .B(n2375), .Y(n2432) );
  CLKINVX1 U1401 ( .A(n2270), .Y(n2271) );
  INVXL U1402 ( .A(chardata[5]), .Y(n2144) );
  INVXL U1403 ( .A(n2133), .Y(n2072) );
  NAND2X1 U1404 ( .A(n2133), .B(n2786), .Y(n2376) );
  OAI21X1 U1405 ( .A0(pat_count[3]), .A1(n2783), .B0(n2502), .Y(n2575) );
  NOR2X2 U1406 ( .A(str_count[1]), .B(str_count[0]), .Y(n2133) );
  NAND2X2 U1407 ( .A(pat_count[1]), .B(pat_count[0]), .Y(n2492) );
  NOR2X6 U1408 ( .A(n1822), .B(n1821), .Y(n1829) );
  NOR2X6 U1409 ( .A(n1827), .B(n1826), .Y(n1828) );
  INVX3 U1410 ( .A(n2096), .Y(n2241) );
  INVX4 U1411 ( .A(ispattern), .Y(n2046) );
  INVX1 U1412 ( .A(n2055), .Y(n2052) );
  NAND2X1 U1413 ( .A(n2244), .B(n2787), .Y(n2053) );
  CLKINVX1 U1414 ( .A(n1804), .Y(n1808) );
  XOR2X2 U1415 ( .A(str_count[4]), .B(n2055), .Y(n2096) );
  NAND3X4 U1416 ( .A(n1292), .B(n1291), .C(n1819), .Y(n1290) );
  BUFX2 U1417 ( .A(pat_count[2]), .Y(n1231) );
  CLKBUFX3 U1418 ( .A(str_start_idx[0]), .Y(n1238) );
  NAND2X4 U1419 ( .A(n1271), .B(n1709), .Y(n1270) );
  NAND2X6 U1420 ( .A(n1263), .B(n1262), .Y(n1832) );
  INVX4 U1421 ( .A(n1535), .Y(n1275) );
  INVX1 U1422 ( .A(n1568), .Y(n1277) );
  NAND2X6 U1423 ( .A(n1456), .B(n1455), .Y(n1811) );
  NAND4BX1 U1424 ( .AN(n1921), .B(n1920), .C(n1919), .D(n1918), .Y(n1928) );
  NAND4BX1 U1425 ( .AN(n1774), .B(n1773), .C(n1772), .D(n1771), .Y(n1775) );
  NAND2X2 U1426 ( .A(n1258), .B(n1481), .Y(n1289) );
  NOR2XL U1427 ( .A(n1801), .B(n1267), .Y(n1266) );
  NOR2X6 U1428 ( .A(n1583), .B(n1582), .Y(n1586) );
  NAND2X1 U1429 ( .A(n1735), .B(STRING[123]), .Y(n1592) );
  OAI22X2 U1430 ( .A0(n1747), .A1(n2763), .B0(n2675), .B1(n1356), .Y(n1632) );
  OAI22X2 U1431 ( .A0(n1747), .A1(n2742), .B0(n2651), .B1(n1356), .Y(n1654) );
  NAND4X2 U1432 ( .A(n1521), .B(n1520), .C(n1519), .D(n1518), .Y(n1522) );
  OAI22X2 U1433 ( .A0(n1747), .A1(n2766), .B0(n2680), .B1(n1356), .Y(n1602) );
  OAI22X2 U1434 ( .A0(n1731), .A1(n2764), .B0(n1759), .B1(n2679), .Y(n1555) );
  OAI22X2 U1435 ( .A0(n1747), .A1(n2744), .B0(n2653), .B1(n1356), .Y(n1615) );
  OAI22X2 U1436 ( .A0(n1747), .A1(n2743), .B0(n2652), .B1(n1356), .Y(n1682) );
  NAND2BX2 U1437 ( .AN(n1260), .B(n1464), .Y(n1259) );
  AOI21X1 U1438 ( .A0(n1878), .A1(n1877), .B0(n1997), .Y(n1882) );
  NAND2X2 U1439 ( .A(n1734), .B(STRING[190]), .Y(n1325) );
  CLKBUFX8 U1440 ( .A(n1907), .Y(n2559) );
  BUFX16 U1441 ( .A(n1531), .Y(n1751) );
  NOR2X4 U1442 ( .A(n1857), .B(str_start_idx[4]), .Y(n2311) );
  OAI22XL U1443 ( .A0(n1790), .A1(n2636), .B0(n1476), .B1(n2729), .Y(n1351) );
  NOR3X4 U1444 ( .A(n1838), .B(str_start_idx[4]), .C(n2589), .Y(n1999) );
  BUFX12 U1445 ( .A(n1736), .Y(n1235) );
  INVX2 U1446 ( .A(n1525), .Y(n1544) );
  BUFX2 U1447 ( .A(n1236), .Y(n1864) );
  NAND2X1 U1448 ( .A(n1838), .B(n2618), .Y(n1860) );
  NOR2X4 U1449 ( .A(n1467), .B(n1474), .Y(n1414) );
  NOR2X4 U1450 ( .A(n1801), .B(n1466), .Y(n1413) );
  NOR2X4 U1451 ( .A(n1433), .B(n1432), .Y(n1436) );
  AOI22X2 U1452 ( .A0(n1794), .A1(PATTERN[21]), .B0(n1793), .B1(PATTERN[45]), 
        .Y(n1443) );
  NAND2X1 U1453 ( .A(n1221), .B(PATTERN[28]), .Y(n1390) );
  NAND2X1 U1454 ( .A(n1221), .B(PATTERN[31]), .Y(n1420) );
  NOR2X2 U1455 ( .A(n1409), .B(n1408), .Y(n1786) );
  NAND2X1 U1456 ( .A(n1221), .B(PATTERN[26]), .Y(n1384) );
  NAND2X1 U1457 ( .A(n1221), .B(PATTERN[24]), .Y(n1399) );
  INVX12 U1458 ( .A(n1407), .Y(n1794) );
  CLKINVX3 U1459 ( .A(n1439), .Y(n1447) );
  BUFX8 U1460 ( .A(n1449), .Y(n1299) );
  INVX12 U1461 ( .A(n1430), .Y(n1791) );
  CLKBUFX8 U1462 ( .A(n1383), .Y(n1418) );
  NOR2X2 U1463 ( .A(n1430), .B(n2706), .Y(n1409) );
  NAND2X6 U1464 ( .A(n1839), .B(n2609), .Y(n1422) );
  NAND2X6 U1465 ( .A(n1316), .B(n1257), .Y(n1407) );
  NOR2X6 U1466 ( .A(n1508), .B(n1243), .Y(n1357) );
  NAND2X6 U1467 ( .A(n1257), .B(n2609), .Y(n1439) );
  NAND2X4 U1468 ( .A(n1379), .B(n2701), .Y(n1283) );
  OR2X6 U1469 ( .A(n1317), .B(n1487), .Y(n1242) );
  NOR2X6 U1470 ( .A(str_start_idx[3]), .B(pat_match_count[3]), .Y(n1511) );
  BUFX8 U1471 ( .A(str_start_idx[1]), .Y(n1851) );
  NOR2X2 U1472 ( .A(n1282), .B(n2609), .Y(n1281) );
  NAND2XL U1473 ( .A(n1750), .B(STRING[244]), .Y(n1657) );
  AOI22XL U1474 ( .A0(n1792), .A1(PATTERN[47]), .B0(n1791), .B1(PATTERN[7]), 
        .Y(n1782) );
  AND3X1 U1475 ( .A(n1480), .B(n1479), .C(n1478), .Y(n1481) );
  NOR4XL U1476 ( .A(STRING[10]), .B(STRING[8]), .C(STRING[11]), .D(STRING[9]), 
        .Y(n2015) );
  NAND4X4 U1477 ( .A(n1785), .B(n1454), .C(n1482), .D(n1239), .Y(n1445) );
  CLKINVX1 U1478 ( .A(n2553), .Y(n1857) );
  NAND2XL U1479 ( .A(n2548), .B(star_exit_start_idx[3]), .Y(n2549) );
  NAND3XL U1480 ( .A(n2509), .B(n2508), .C(n2507), .Y(n2510) );
  INVXL U1481 ( .A(n2312), .Y(n1230) );
  NOR2XL U1482 ( .A(n2561), .B(n2553), .Y(n2554) );
  NAND3XL U1483 ( .A(n2312), .B(n1238), .C(n1838), .Y(n2314) );
  CLKINVX2 U1484 ( .A(n1308), .Y(n1852) );
  CLKAND2X8 U1485 ( .A(n2197), .B(str_count[4]), .Y(n2232) );
  NAND2XL U1486 ( .A(n2468), .B(STRING[198]), .Y(n2060) );
  NAND2XL U1487 ( .A(n2168), .B(n2178), .Y(n2153) );
  NAND2XL U1488 ( .A(n2168), .B(n2150), .Y(n2151) );
  NAND2XL U1489 ( .A(n1219), .B(STRING[16]), .Y(n2420) );
  NAND2XL U1490 ( .A(n2470), .B(n2462), .Y(n2463) );
  NAND2X2 U1491 ( .A(n2367), .B(n2372), .Y(n2460) );
  NAND2XL U1492 ( .A(n1219), .B(STRING[21]), .Y(n2473) );
  NAND2X1 U1493 ( .A(n2697), .B(n2585), .Y(n2262) );
  NAND2XL U1494 ( .A(chardata[6]), .B(n2349), .Y(n2292) );
  NAND2XL U1495 ( .A(chardata[4]), .B(n2346), .Y(n2339) );
  NAND2XL U1496 ( .A(chardata[2]), .B(n2296), .Y(n2266) );
  NAND2XL U1497 ( .A(n2128), .B(STRING[121]), .Y(n2130) );
  NAND2XL U1498 ( .A(n1369), .B(STRING[66]), .Y(n2234) );
  NAND2XL U1499 ( .A(n2165), .B(n2148), .Y(n2066) );
  NAND2XL U1500 ( .A(STRING[249]), .B(n2472), .Y(n2392) );
  NAND2XL U1501 ( .A(n2101), .B(STRING[140]), .Y(n2098) );
  NAND2XL U1502 ( .A(n2429), .B(STRING[196]), .Y(n2410) );
  BUFX4 U1503 ( .A(n2083), .Y(n2177) );
  NAND2X2 U1504 ( .A(n2365), .B(n2372), .Y(n2454) );
  OAI21XL U1505 ( .A0(n2425), .A1(n2468), .B0(n2060), .Y(n1136) );
  OAI21XL U1506 ( .A0(n2101), .A1(n2415), .B0(n2099), .Y(n1070) );
  OAI21XL U1507 ( .A0(n1217), .A1(n2408), .B0(n2209), .Y(n970) );
  OAI21XL U1508 ( .A0(n2180), .A1(n2725), .B0(n2179), .Y(n1152) );
  OAI21XL U1509 ( .A0(n2168), .A1(n2812), .B0(n2151), .Y(n1180) );
  OAI21XL U1510 ( .A0(n1226), .A1(n2425), .B0(n2186), .Y(n1024) );
  OAI21XL U1511 ( .A0(n1216), .A1(n2399), .B0(n2395), .Y(n955) );
  OAI21XL U1512 ( .A0(n2177), .A1(n2753), .B0(n2146), .Y(n1141) );
  OAI21XL U1513 ( .A0(n2165), .A1(n2803), .B0(n2164), .Y(n1173) );
  AOI21XL U1514 ( .A0(n2256), .A1(n2049), .B0(n1229), .Y(n924) );
  OAI21XL U1515 ( .A0(n2388), .A1(n2427), .B0(n2369), .Y(n1105) );
  OAI21XL U1516 ( .A0(n2128), .A1(n2408), .B0(n2129), .Y(n1050) );
  OAI21XL U1517 ( .A0(n2408), .A1(n2472), .B0(n2403), .Y(n1186) );
  OAI21XL U1518 ( .A0(n2399), .A1(n2468), .B0(n2059), .Y(n1131) );
  OAI21XL U1519 ( .A0(n2101), .A1(n2436), .B0(n2098), .Y(n1068) );
  OAI21XL U1520 ( .A0(n1217), .A1(n2415), .B0(n2208), .Y(n974) );
  OAI21XL U1521 ( .A0(n2415), .A1(n2429), .B0(n2410), .Y(n1126) );
  OAI21XL U1522 ( .A0(n1227), .A1(n2447), .B0(n2109), .Y(n1031) );
  OAI21XL U1523 ( .A0(n2177), .A1(n2640), .B0(n2091), .Y(n1143) );
  NAND2X4 U1524 ( .A(n2232), .B(n2373), .Y(n1215) );
  NAND2X4 U1525 ( .A(n2232), .B(n2366), .Y(n1216) );
  NAND2X4 U1526 ( .A(n2232), .B(n2367), .Y(n1217) );
  NAND2X4 U1527 ( .A(n2232), .B(n2365), .Y(n1218) );
  NAND2X4 U1528 ( .A(n2232), .B(n2383), .Y(n1219) );
  OA22X4 U1529 ( .A0(n1722), .A1(n2595), .B0(n1757), .B1(n2650), .Y(n1220) );
  AND2X8 U1530 ( .A(n1379), .B(n1281), .Y(n1221) );
  CLKINVX1 U1531 ( .A(n2431), .Y(n2464) );
  CLKINVX1 U1532 ( .A(n2427), .Y(n2368) );
  OR2X4 U1533 ( .A(n2307), .B(n2321), .Y(n1843) );
  OAI22X2 U1534 ( .A0(n2739), .A1(n1747), .B0(n1759), .B1(n2643), .Y(n1704) );
  BUFX8 U1535 ( .A(n2305), .Y(n1284) );
  OAI2BB1X1 U1536 ( .A0N(n2472), .A1N(STRING[251]), .B0(n2471), .Y(n1189) );
  OAI2BB1X1 U1537 ( .A0N(STRING[203]), .A1N(n2468), .B0(n2467), .Y(n1133) );
  INVX3 U1538 ( .A(n2472), .Y(n2469) );
  NAND2X4 U1539 ( .A(n1235), .B(STRING[174]), .Y(n1326) );
  BUFX8 U1540 ( .A(n2122), .Y(n1226) );
  BUFX8 U1541 ( .A(n2108), .Y(n1227) );
  OR2X8 U1542 ( .A(n2242), .B(n2097), .Y(n2375) );
  AND2X2 U1543 ( .A(n1849), .B(n1848), .Y(n2037) );
  INVX6 U1544 ( .A(n2352), .Y(n2354) );
  INVX4 U1545 ( .A(n2349), .Y(n2351) );
  NOR2X6 U1546 ( .A(n2272), .B(pat_count[1]), .Y(n2352) );
  NAND2X2 U1547 ( .A(pat_count[0]), .B(n2271), .Y(n2272) );
  NOR2X8 U1548 ( .A(pat_count[0]), .B(n2290), .Y(n2117) );
  NOR2X4 U1549 ( .A(str_count[2]), .B(n2069), .Y(n2367) );
  INVX3 U1550 ( .A(n2244), .Y(n2198) );
  NAND2X4 U1551 ( .A(n2324), .B(n2323), .Y(n2348) );
  NOR2X6 U1552 ( .A(n2318), .B(n2317), .Y(n2342) );
  INVX3 U1553 ( .A(n2324), .Y(n2318) );
  OR2X2 U1554 ( .A(n2492), .B(n1231), .Y(n2317) );
  INVX12 U1555 ( .A(n2478), .Y(n2470) );
  NOR2X8 U1556 ( .A(pat_count[3]), .B(n2046), .Y(n2324) );
  NOR3X2 U1557 ( .A(n2781), .B(n2786), .C(str_count[0]), .Y(n2383) );
  CLKBUFX8 U1558 ( .A(n2044), .Y(n1222) );
  NAND2X6 U1559 ( .A(n1842), .B(n1284), .Y(n1302) );
  NOR3X6 U1560 ( .A(n1331), .B(n1330), .C(n1329), .Y(n1328) );
  NOR2X6 U1561 ( .A(n1340), .B(n1224), .Y(n1330) );
  OAI21X1 U1562 ( .A0(n2425), .A1(n2472), .B0(n2419), .Y(n1192) );
  OAI21X1 U1563 ( .A0(n2388), .A1(n2472), .B0(n2378), .Y(n1185) );
  OAI21X1 U1564 ( .A0(n2447), .A1(n2472), .B0(n2440), .Y(n1191) );
  OAI21X1 U1565 ( .A0(n2415), .A1(n2472), .B0(n2412), .Y(n1190) );
  OAI21X1 U1566 ( .A0(n2399), .A1(n2472), .B0(n2392), .Y(n1187) );
  NAND2X4 U1567 ( .A(n2366), .B(n2372), .Y(n2457) );
  BUFX12 U1568 ( .A(n2445), .Y(n2483) );
  INVX1 U1569 ( .A(n2276), .Y(n2274) );
  INVX1 U1570 ( .A(n2279), .Y(n2277) );
  BUFX12 U1571 ( .A(n2448), .Y(n2485) );
  NAND2BX4 U1572 ( .AN(n2386), .B(n2373), .Y(n2128) );
  NAND2BX4 U1573 ( .AN(n2386), .B(n2198), .Y(n2101) );
  NAND2X6 U1574 ( .A(n2197), .B(n2241), .Y(n2364) );
  NOR2X6 U1575 ( .A(n2240), .B(n2097), .Y(n2197) );
  XOR2X1 U1576 ( .A(n2500), .B(n2032), .Y(n2035) );
  INVX16 U1577 ( .A(n1221), .Y(n1476) );
  NAND2X1 U1578 ( .A(chardata[3]), .B(n2342), .Y(n2319) );
  NAND2X1 U1579 ( .A(chardata[6]), .B(n2342), .Y(n2338) );
  NAND2X1 U1580 ( .A(chardata[0]), .B(n2342), .Y(n2326) );
  NAND2X1 U1581 ( .A(chardata[2]), .B(n2342), .Y(n2329) );
  INVX1 U1582 ( .A(n2563), .Y(n2550) );
  NAND2X1 U1583 ( .A(chardata[1]), .B(n2342), .Y(n2343) );
  NAND2X1 U1584 ( .A(chardata[7]), .B(n2342), .Y(n2332) );
  NAND2X1 U1585 ( .A(chardata[4]), .B(n2342), .Y(n2340) );
  NAND2X1 U1586 ( .A(chardata[5]), .B(n2342), .Y(n2320) );
  INVX1 U1587 ( .A(n1229), .Y(n1319) );
  INVX3 U1588 ( .A(n2586), .Y(n1229) );
  INVX1 U1589 ( .A(n2532), .Y(n2321) );
  NAND2XL U1590 ( .A(n1853), .B(n2586), .Y(n1346) );
  BUFX12 U1591 ( .A(n2044), .Y(n2829) );
  CLKBUFX8 U1592 ( .A(n2044), .Y(n2828) );
  CLKBUFX8 U1593 ( .A(n2044), .Y(n2827) );
  NOR2X2 U1594 ( .A(n2785), .B(state[0]), .Y(n2532) );
  NAND2X6 U1595 ( .A(state[1]), .B(state[0]), .Y(n2586) );
  INVX1 U1596 ( .A(str_start_idx[5]), .Y(n2012) );
  AND2X8 U1597 ( .A(n2144), .B(isstring), .Y(n2478) );
  INVX12 U1598 ( .A(reset), .Y(n2044) );
  NAND2X4 U1599 ( .A(n1288), .B(n1287), .Y(n1286) );
  OAI2BB1X2 U1600 ( .A0N(STRING[195]), .A1N(n2429), .B0(n2463), .Y(n1125) );
  NAND2X6 U1601 ( .A(n1289), .B(n1482), .Y(n1814) );
  NAND2X2 U1602 ( .A(n2427), .B(STRING[177]), .Y(n2389) );
  NAND2X2 U1603 ( .A(n2431), .B(STRING[185]), .Y(n2391) );
  NAND2X2 U1604 ( .A(n2431), .B(STRING[186]), .Y(n2430) );
  OAI2BB1X2 U1605 ( .A0N(STRING[163]), .A1N(n2454), .B0(n2453), .Y(n1093) );
  OAI2BB1X2 U1606 ( .A0N(STRING[179]), .A1N(n2427), .B0(n2461), .Y(n1109) );
  NAND2X2 U1607 ( .A(n2427), .B(STRING[178]), .Y(n2426) );
  OAI2BB1X2 U1608 ( .A0N(STRING[187]), .A1N(n2431), .B0(n2465), .Y(n1117) );
  OAI2BB1X2 U1609 ( .A0N(STRING[156]), .A1N(n2457), .B0(n2456), .Y(n1085) );
  INVX4 U1610 ( .A(n1709), .Y(n1224) );
  INVX8 U1611 ( .A(n1568), .Y(n1764) );
  INVX12 U1612 ( .A(n1733), .Y(n1225) );
  NAND2X2 U1613 ( .A(n2485), .B(STRING[112]), .Y(n2423) );
  NAND2X2 U1614 ( .A(n2483), .B(STRING[84]), .Y(n2434) );
  NAND2X2 U1615 ( .A(n2485), .B(STRING[119]), .Y(n2446) );
  NAND2X2 U1616 ( .A(n2483), .B(STRING[82]), .Y(n2406) );
  NAND2X2 U1617 ( .A(n2483), .B(STRING[86]), .Y(n2413) );
  NAND2X2 U1618 ( .A(n2483), .B(STRING[81]), .Y(n2384) );
  INVX16 U1619 ( .A(n1490), .Y(n1527) );
  INVX12 U1620 ( .A(n1496), .Y(n1515) );
  INVX8 U1621 ( .A(n2364), .Y(n2372) );
  NOR2X1 U1622 ( .A(n2697), .B(n2432), .Y(n2433) );
  BUFX8 U1623 ( .A(n2063), .Y(n2165) );
  NOR2BX2 U1624 ( .AN(n1266), .B(n1802), .Y(n1803) );
  BUFX8 U1625 ( .A(n2147), .Y(n2168) );
  NOR2BX2 U1626 ( .AN(n1470), .B(n1349), .Y(n1348) );
  MX2X4 U1627 ( .A(n1917), .B(n1916), .S0(n2025), .Y(n1930) );
  NAND3X4 U1628 ( .A(n1400), .B(n1399), .C(n1398), .Y(n1801) );
  NAND2X2 U1629 ( .A(n1353), .B(n1350), .Y(n1349) );
  INVX2 U1630 ( .A(n2035), .Y(n1228) );
  INVX1 U1631 ( .A(n1846), .Y(n1849) );
  INVX1 U1632 ( .A(n1305), .Y(n1304) );
  INVX6 U1633 ( .A(n2342), .Y(n2344) );
  AND2X1 U1634 ( .A(n1841), .B(n1840), .Y(n2038) );
  MX2X1 U1635 ( .A(n2019), .B(n2018), .S0(n1238), .Y(n2020) );
  NOR2X1 U1636 ( .A(n2500), .B(n2499), .Y(n2501) );
  NOR3X1 U1637 ( .A(n2693), .B(n1231), .C(pat_count[0]), .Y(n2323) );
  INVX1 U1638 ( .A(n1853), .Y(n1854) );
  INVXL U1639 ( .A(n1838), .Y(n1307) );
  NOR2X6 U1640 ( .A(n2781), .B(n2779), .Y(n2068) );
  AND2X2 U1641 ( .A(isstring), .B(n2697), .Y(n2377) );
  BUFX3 U1642 ( .A(pat_match_count[3]), .Y(n2500) );
  INVX2 U1643 ( .A(n2780), .Y(n1363) );
  INVX3 U1644 ( .A(star_exit), .Y(n2565) );
  NAND2X4 U1645 ( .A(n1231), .B(n2324), .Y(n2270) );
  NAND2X6 U1646 ( .A(n1483), .B(n1303), .Y(n1355) );
  NAND4BX4 U1647 ( .AN(n1683), .B(n1685), .C(n1684), .D(n1232), .Y(n1687) );
  INVX3 U1648 ( .A(n1682), .Y(n1232) );
  AOI22X2 U1649 ( .A0(n1734), .A1(STRING[253]), .B0(n1752), .B1(STRING[237]), 
        .Y(n1678) );
  BUFX6 U1650 ( .A(n1735), .Y(n1648) );
  OAI22X2 U1651 ( .A0(n1758), .A1(n2658), .B0(n1757), .B1(n2591), .Y(n1673) );
  NAND3X6 U1652 ( .A(n1662), .B(n1661), .C(n1660), .Y(n1807) );
  INVX20 U1653 ( .A(n1527), .Y(n1722) );
  AOI22X2 U1654 ( .A0(n1794), .A1(PATTERN[17]), .B0(n1449), .B1(PATTERN[33]), 
        .Y(n1428) );
  INVX6 U1655 ( .A(n1233), .Y(n1373) );
  NAND2X6 U1656 ( .A(n1735), .B(STRING[189]), .Y(n1233) );
  AOI22X1 U1657 ( .A0(n1753), .A1(STRING[248]), .B0(n1752), .B1(STRING[232]), 
        .Y(n1706) );
  INVX16 U1658 ( .A(n1494), .Y(n1528) );
  NAND2X4 U1659 ( .A(n1710), .B(n1709), .Y(n1720) );
  INVX20 U1660 ( .A(n1515), .Y(n1356) );
  NOR2X4 U1661 ( .A(n1441), .B(n1440), .Y(n1444) );
  AND2X8 U1662 ( .A(n1526), .B(n1544), .Y(n1733) );
  NOR2X6 U1663 ( .A(n2529), .B(n1514), .Y(n1526) );
  OAI22X4 U1664 ( .A0(n1760), .A1(n2666), .B0(n1356), .B1(n2598), .Y(n1663) );
  OAI22X4 U1665 ( .A0(n2671), .A1(n1758), .B0(n1757), .B1(n2600), .Y(n1664) );
  NAND2X6 U1666 ( .A(n1491), .B(n2524), .Y(n1492) );
  NOR3X4 U1667 ( .A(n1610), .B(n1611), .C(n1234), .Y(n1612) );
  OAI22X4 U1668 ( .A0(n1722), .A1(n2678), .B0(n1732), .B1(n2762), .Y(n1234) );
  NOR2BX4 U1669 ( .AN(n1339), .B(n1335), .Y(n1334) );
  NAND4X4 U1670 ( .A(n1640), .B(n1639), .C(n1638), .D(n1637), .Y(n1643) );
  NAND4X6 U1671 ( .A(n1276), .B(n1273), .C(n1270), .D(n1268), .Y(n1298) );
  NAND3X4 U1672 ( .A(n1605), .B(n1604), .C(n1603), .Y(n1613) );
  OAI22X4 U1673 ( .A0(n2740), .A1(n1722), .B0(n1757), .B1(n2646), .Y(n1705) );
  OAI22X4 U1674 ( .A0(n2665), .A1(n1760), .B0(n1759), .B1(n2597), .Y(n1711) );
  NAND3X2 U1675 ( .A(n1708), .B(n1707), .C(n1706), .Y(n1710) );
  NAND3X4 U1676 ( .A(n1716), .B(n1715), .C(n1714), .Y(n1718) );
  INVX16 U1677 ( .A(n1241), .Y(n1508) );
  BUFX12 U1678 ( .A(n2359), .Y(n1308) );
  OAI22X4 U1679 ( .A0(n1731), .A1(n2596), .B0(n1759), .B1(n2656), .Y(n1671) );
  NOR3X4 U1680 ( .A(n1673), .B(n1672), .C(n1671), .Y(n1674) );
  MXI2X4 U1681 ( .A(n1928), .B(n1927), .S0(n2025), .Y(n1929) );
  OAI22X2 U1682 ( .A0(n2637), .A1(n1997), .B0(n1922), .B1(n2731), .Y(n1926) );
  NAND2X6 U1683 ( .A(n2013), .B(n2012), .Y(n2022) );
  AOI2BB1X2 U1684 ( .A0N(n2539), .A1N(n2538), .B0(n2586), .Y(N772) );
  INVX3 U1685 ( .A(n1300), .Y(n1837) );
  INVX3 U1686 ( .A(n1906), .Y(n2552) );
  NOR3X4 U1687 ( .A(n1309), .B(n2358), .C(n2357), .Y(n2360) );
  BUFX12 U1688 ( .A(str_start_idx[2]), .Y(n1236) );
  INVX20 U1689 ( .A(n1527), .Y(n1758) );
  OAI21X2 U1690 ( .A0(n1309), .A1(n2314), .B0(n2313), .Y(n2315) );
  NAND3X6 U1691 ( .A(n1237), .B(n1688), .C(n1689), .Y(n1818) );
  AOI2BB2X4 U1692 ( .B0(n1675), .B1(n1764), .A0N(n1674), .A1N(n1225), .Y(n1237) );
  NAND2X6 U1693 ( .A(n1309), .B(n2586), .Y(n2361) );
  NAND3X8 U1694 ( .A(n1598), .B(n1599), .C(n1597), .Y(n1815) );
  NOR2X4 U1695 ( .A(n1570), .B(n1569), .Y(n1573) );
  NAND3X2 U1696 ( .A(n1586), .B(n1585), .C(n1584), .Y(n1590) );
  INVX8 U1697 ( .A(n1360), .Y(n1493) );
  NAND2X8 U1698 ( .A(n1358), .B(n1359), .Y(n1360) );
  NAND4BBX4 U1699 ( .AN(n1621), .BN(n1620), .C(n1623), .D(n1622), .Y(n1625) );
  NAND3X4 U1700 ( .A(n1576), .B(n1575), .C(n1574), .Y(n1579) );
  OAI22X4 U1701 ( .A0(n2732), .A1(n1760), .B0(n1759), .B1(n2640), .Y(n1676) );
  NAND2X4 U1702 ( .A(n1681), .B(n1709), .Y(n1689) );
  INVX3 U1703 ( .A(n1509), .Y(n1323) );
  NOR2X4 U1704 ( .A(n1511), .B(n1509), .Y(n1244) );
  NOR2X8 U1705 ( .A(pat_match_count[2]), .B(str_start_idx[2]), .Y(n1509) );
  NAND2X8 U1706 ( .A(n1462), .B(n1239), .Y(n1833) );
  NAND3X6 U1707 ( .A(n1443), .B(n1442), .C(n1444), .Y(n1239) );
  XNOR2X4 U1708 ( .A(n1818), .B(n1292), .Y(n1822) );
  AND2X8 U1709 ( .A(n1789), .B(n1240), .Y(n1292) );
  NAND2X4 U1710 ( .A(n1300), .B(n1784), .Y(n1240) );
  INVX3 U1711 ( .A(n1244), .Y(n1243) );
  NAND2X8 U1712 ( .A(n1242), .B(n1303), .Y(n1241) );
  NAND2X8 U1713 ( .A(n2486), .B(n1851), .Y(n1303) );
  NAND4X6 U1714 ( .A(n1254), .B(n1249), .C(n1247), .D(n1245), .Y(n1823) );
  OAI21X4 U1715 ( .A0(n1557), .A1(n1246), .B0(n1733), .Y(n1245) );
  NAND4X2 U1716 ( .A(n1554), .B(n1552), .C(n1551), .D(n1553), .Y(n1246) );
  NAND2X4 U1717 ( .A(n1248), .B(n1709), .Y(n1247) );
  NAND4X4 U1718 ( .A(n1560), .B(n1561), .C(n1558), .D(n1559), .Y(n1248) );
  AOI21X4 U1719 ( .A0(n1251), .A1(n1744), .B0(n1250), .Y(n1249) );
  OAI22X2 U1720 ( .A0(n1741), .A1(n2649), .B0(n1742), .B1(n2741), .Y(n1250) );
  NAND4BBX4 U1721 ( .AN(n1548), .BN(n1549), .C(n1253), .D(n1252), .Y(n1251) );
  AOI22X4 U1722 ( .A0(STRING[141]), .A1(n1724), .B0(n1750), .B1(STRING[125]), 
        .Y(n1252) );
  AOI22X4 U1723 ( .A0(n1752), .A1(STRING[117]), .B0(n1734), .B1(STRING[133]), 
        .Y(n1253) );
  OAI21X4 U1724 ( .A0(n1256), .A1(n1255), .B0(n1764), .Y(n1254) );
  NAND2X2 U1725 ( .A(n1564), .B(n1565), .Y(n1255) );
  NAND2X4 U1726 ( .A(n1567), .B(n1566), .Y(n1256) );
  INVXL U1727 ( .A(n1257), .Y(n1840) );
  NOR2X8 U1728 ( .A(n2486), .B(n2821), .Y(n1257) );
  BUFX20 U1729 ( .A(n1285), .Y(n1258) );
  OAI2BB1X4 U1730 ( .A0N(n1259), .A1N(n1285), .B0(n1374), .Y(n1804) );
  NOR2X8 U1731 ( .A(n1446), .B(n1445), .Y(n1285) );
  NAND3BX2 U1732 ( .AN(n1465), .B(n1463), .C(n1261), .Y(n1260) );
  AOI22X2 U1733 ( .A0(n1846), .A1(PATTERN[28]), .B0(PATTERN[36]), .B1(n1793), 
        .Y(n1261) );
  NAND2X4 U1734 ( .A(n1832), .B(n1814), .Y(n1288) );
  INVX4 U1735 ( .A(n1804), .Y(n1262) );
  INVX4 U1736 ( .A(n1805), .Y(n1263) );
  OAI2BB1X4 U1737 ( .A0N(n1352), .A1N(n1285), .B0(n1475), .Y(n1805) );
  NAND2X6 U1738 ( .A(n1265), .B(n1264), .Y(n1388) );
  INVX3 U1739 ( .A(n1267), .Y(n1264) );
  INVX3 U1740 ( .A(n1472), .Y(n1265) );
  OAI22X4 U1741 ( .A0(n1430), .A1(n2723), .B0(n1407), .B1(n2626), .Y(n1267) );
  AOI21X4 U1742 ( .A0(n1547), .A1(n1280), .B0(n1298), .Y(n1631) );
  NAND2X4 U1743 ( .A(n1269), .B(n1733), .Y(n1268) );
  NAND3X2 U1744 ( .A(n1503), .B(n1502), .C(n1501), .Y(n1269) );
  NAND2BX4 U1745 ( .AN(n1272), .B(n1543), .Y(n1271) );
  NAND2X2 U1746 ( .A(n1542), .B(n1541), .Y(n1272) );
  OAI21X4 U1747 ( .A0(n1275), .A1(n1274), .B0(n1744), .Y(n1273) );
  NAND2X4 U1748 ( .A(n1534), .B(n1533), .Y(n1274) );
  AOI21X4 U1749 ( .A0(n1278), .A1(n1277), .B0(n1538), .Y(n1276) );
  NAND2BX4 U1750 ( .AN(n1522), .B(n1279), .Y(n1278) );
  NOR2X4 U1751 ( .A(n1523), .B(n1524), .Y(n1279) );
  NAND4X4 U1752 ( .A(n1834), .B(n1833), .C(n1805), .D(n1804), .Y(n1280) );
  INVX3 U1753 ( .A(n2701), .Y(n1282) );
  NOR2X8 U1754 ( .A(n1283), .B(n2488), .Y(n1383) );
  NOR2X8 U1755 ( .A(n1290), .B(n1286), .Y(n2305) );
  OAI21X4 U1756 ( .A0(n1834), .A1(n1833), .B0(n1814), .Y(n1287) );
  NAND2X6 U1757 ( .A(n1779), .B(n1778), .Y(n1819) );
  INVX3 U1758 ( .A(n1824), .Y(n1291) );
  OAI2BB1X4 U1759 ( .A0N(n1258), .A1N(n1799), .B0(n1803), .Y(n1824) );
  NOR2X4 U1760 ( .A(n1309), .B(n2358), .Y(n1294) );
  NAND2X4 U1761 ( .A(n1294), .B(n1854), .Y(n1855) );
  MXI2X4 U1762 ( .A(n2489), .B(n2030), .S0(n1295), .Y(N650) );
  MXI2X4 U1763 ( .A(n1228), .B(n2033), .S0(n1295), .Y(N653) );
  MXI2X4 U1764 ( .A(n2038), .B(n1845), .S0(n1295), .Y(N651) );
  MXI2X4 U1765 ( .A(n2037), .B(n1850), .S0(n1295), .Y(N652) );
  NOR2X8 U1766 ( .A(n1297), .B(n1296), .Y(n1295) );
  NAND2X8 U1767 ( .A(n1844), .B(n2513), .Y(n1296) );
  INVX4 U1768 ( .A(n1843), .Y(n1297) );
  NAND2X4 U1769 ( .A(n1734), .B(STRING[191]), .Y(n1609) );
  NAND2X2 U1770 ( .A(n1713), .B(STRING[179]), .Y(n1551) );
  OAI22X4 U1771 ( .A0(n2771), .A1(n1758), .B0(n1732), .B1(n2685), .Y(n1523) );
  NAND2X4 U1772 ( .A(n1735), .B(STRING[183]), .Y(n1606) );
  NOR2X4 U1773 ( .A(n1633), .B(n1632), .Y(n1636) );
  INVX12 U1774 ( .A(n1492), .Y(n1516) );
  OAI22X4 U1775 ( .A0(n1731), .A1(n2642), .B0(n1759), .B1(n2736), .Y(n1570) );
  INVX12 U1776 ( .A(n1361), .Y(n2529) );
  BUFX16 U1777 ( .A(n1316), .Y(n2488) );
  NAND2X4 U1778 ( .A(n1300), .B(n1775), .Y(n1779) );
  NAND4X6 U1779 ( .A(n1415), .B(n1413), .C(n1414), .D(n1412), .Y(n1446) );
  OAI22X4 U1780 ( .A0(n2751), .A1(n1722), .B0(n1732), .B1(n2661), .Y(n1540) );
  NAND2X8 U1781 ( .A(n1489), .B(n2524), .Y(n1490) );
  INVX4 U1782 ( .A(n1731), .Y(n1562) );
  NOR2X8 U1783 ( .A(n1499), .B(n2524), .Y(n1531) );
  INVX20 U1784 ( .A(n1528), .Y(n1747) );
  NOR2X4 U1785 ( .A(n1705), .B(n1704), .Y(n1708) );
  NAND2X4 U1786 ( .A(n1751), .B(STRING[199]), .Y(n1608) );
  INVX3 U1787 ( .A(n1820), .Y(n1767) );
  XNOR2X4 U1788 ( .A(n1298), .B(n1808), .Y(n1809) );
  NAND2X8 U1789 ( .A(n1839), .B(n1316), .Y(n1430) );
  INVX8 U1790 ( .A(n1449), .Y(n1417) );
  AOI22X4 U1791 ( .A0(n1791), .A1(PATTERN[13]), .B0(n1299), .B1(PATTERN[37]), 
        .Y(n1442) );
  NOR2X8 U1792 ( .A(n1847), .B(n2488), .Y(n1449) );
  BUFX20 U1793 ( .A(n1258), .Y(n1300) );
  NOR2X8 U1794 ( .A(n2359), .B(n2698), .Y(n1318) );
  NAND3X8 U1795 ( .A(n1302), .B(n2307), .C(n1301), .Y(n2359) );
  AOI21X4 U1796 ( .A0(n2305), .A1(n1378), .B0(n2511), .Y(n1301) );
  NAND4X8 U1797 ( .A(n1831), .B(n1829), .C(n1830), .D(n1828), .Y(n2307) );
  AOI22X4 U1798 ( .A0(n1852), .A1(n1306), .B0(n1320), .B1(n1304), .Y(n1313) );
  NAND2X1 U1799 ( .A(n1319), .B(n1838), .Y(n1305) );
  NOR2BX1 U1800 ( .AN(n1230), .B(n1307), .Y(n1306) );
  BUFX20 U1801 ( .A(n2359), .Y(n1309) );
  NAND2X4 U1802 ( .A(n1313), .B(n1310), .Y(n855) );
  OR2X4 U1803 ( .A(n1309), .B(n1311), .Y(n1310) );
  NAND2BX1 U1804 ( .AN(n1230), .B(n1312), .Y(n1311) );
  NOR2XL U1805 ( .A(n1838), .B(n2698), .Y(n1312) );
  INVX6 U1806 ( .A(n1314), .Y(n1495) );
  NOR2X8 U1807 ( .A(n2524), .B(n1314), .Y(n1550) );
  NAND2X8 U1808 ( .A(n2520), .B(n2521), .Y(n1314) );
  NAND2X6 U1809 ( .A(pat_match_count[0]), .B(str_start_idx[0]), .Y(n1487) );
  NOR2X8 U1810 ( .A(pat_match_count[1]), .B(str_start_idx[1]), .Y(n1317) );
  BUFX8 U1811 ( .A(n1487), .Y(n1315) );
  BUFX20 U1812 ( .A(pat_match_count[2]), .Y(n1316) );
  INVX3 U1813 ( .A(n1317), .Y(n1483) );
  AOI2BB2X4 U1814 ( .B0(n1223), .B1(n1347), .A0N(n1318), .A1N(n1346), .Y(n1856) );
  INVX3 U1815 ( .A(n1318), .Y(n1320) );
  OAI21X2 U1816 ( .A0(n1318), .A1(n1322), .B0(n1321), .Y(n857) );
  NAND2X2 U1817 ( .A(n1318), .B(n2696), .Y(n1321) );
  NAND2BX1 U1818 ( .AN(n1229), .B(n2025), .Y(n1322) );
  OAI21X4 U1819 ( .A0(n1509), .A1(n1508), .B0(n1507), .Y(n1513) );
  NAND2X6 U1820 ( .A(n1323), .B(n1507), .Y(n1324) );
  NAND2X6 U1821 ( .A(n1316), .B(n1236), .Y(n1507) );
  XOR2X4 U1822 ( .A(n1508), .B(n1324), .Y(n1488) );
  NAND2X2 U1823 ( .A(n1326), .B(n1325), .Y(n1327) );
  NAND4X6 U1824 ( .A(n1334), .B(n1765), .C(n1328), .D(n1337), .Y(n1825) );
  NOR2X6 U1825 ( .A(n1344), .B(n1225), .Y(n1329) );
  OAI2BB1X4 U1826 ( .A0N(n1327), .A1N(n1733), .B0(n1332), .Y(n1331) );
  NAND2X4 U1827 ( .A(n1333), .B(n1709), .Y(n1332) );
  NAND3X4 U1828 ( .A(n1729), .B(n1728), .C(n1730), .Y(n1333) );
  AOI21X4 U1829 ( .A0(n1336), .A1(n1220), .B0(n1225), .Y(n1335) );
  AOI2BB1X4 U1830 ( .A0N(n1364), .A1N(n1726), .B0(n1723), .Y(n1336) );
  INVX3 U1831 ( .A(n1744), .Y(n1763) );
  NAND2X4 U1832 ( .A(n1338), .B(n1764), .Y(n1337) );
  NAND3X4 U1833 ( .A(n1755), .B(n1756), .C(n1754), .Y(n1338) );
  OAI21X4 U1834 ( .A0(n1762), .A1(n1761), .B0(n1744), .Y(n1339) );
  NOR3X6 U1835 ( .A(n1343), .B(n1342), .C(n1341), .Y(n1340) );
  NOR2X4 U1836 ( .A(n1731), .B(n2720), .Y(n1341) );
  NOR2X4 U1837 ( .A(n1722), .B(n2632), .Y(n1342) );
  OAI22X4 U1838 ( .A0(n1732), .A1(n2725), .B0(n1356), .B1(n2628), .Y(n1343) );
  INVX3 U1839 ( .A(n1345), .Y(n1344) );
  NOR2BX4 U1840 ( .AN(STRING[198]), .B(n1727), .Y(n1345) );
  NOR2BX1 U1841 ( .AN(n1853), .B(n2025), .Y(n1347) );
  NAND3BX2 U1842 ( .AN(n1351), .B(n1471), .C(n1348), .Y(n1352) );
  NAND2X1 U1843 ( .A(n1791), .B(PATTERN[6]), .Y(n1350) );
  NAND2X2 U1844 ( .A(n1792), .B(PATTERN[46]), .Y(n1353) );
  INVX12 U1845 ( .A(n1354), .Y(n2520) );
  XNOR2X4 U1846 ( .A(n1355), .B(n1315), .Y(n1354) );
  OAI22X4 U1847 ( .A0(n1760), .A1(n2770), .B0(n2684), .B1(n1356), .Y(n1524) );
  OAI22X4 U1848 ( .A0(n1731), .A1(n2593), .B0(n2647), .B1(n1356), .Y(n1723) );
  OAI22X4 U1849 ( .A0(n1731), .A1(n2659), .B0(n2748), .B1(n1356), .Y(n1548) );
  OAI22X4 U1850 ( .A0(n1731), .A1(n2662), .B0(n2749), .B1(n1356), .Y(n1699) );
  OAI22X4 U1851 ( .A0(n1747), .A1(n2604), .B0(n2587), .B1(n1356), .Y(n1690) );
  OAI22X4 U1852 ( .A0(n1747), .A1(n2627), .B0(n2713), .B1(n1356), .Y(n1582) );
  NOR2X8 U1853 ( .A(n1357), .B(n1504), .Y(n1505) );
  INVX8 U1854 ( .A(n2520), .Y(n1358) );
  INVX4 U1855 ( .A(n1537), .Y(n1359) );
  NOR2X8 U1856 ( .A(n1360), .B(n2524), .Y(n1517) );
  INVX12 U1857 ( .A(n1362), .Y(n1741) );
  OAI22X2 U1858 ( .A0(n2674), .A1(n1741), .B0(n1742), .B1(n2602), .Y(n1743) );
  NAND2X6 U1859 ( .A(n2529), .B(n2521), .Y(n1742) );
  AND2X4 U1860 ( .A(n2529), .B(n1537), .Y(n1362) );
  XNOR2X4 U1861 ( .A(n1506), .B(n1363), .Y(n1361) );
  CLKBUFX3 U1862 ( .A(n2307), .Y(n2308) );
  AO22X2 U1863 ( .A0(n1793), .A1(PATTERN[37]), .B0(n1846), .B1(PATTERN[29]), 
        .Y(n1367) );
  BUFX4 U1864 ( .A(n2137), .Y(n2196) );
  BUFX4 U1865 ( .A(n2113), .Y(n2190) );
  NAND2X4 U1866 ( .A(n2232), .B(n2370), .Y(n1369) );
  NAND2X4 U1867 ( .A(n2232), .B(n2385), .Y(n1370) );
  CLKAND2X3 U1868 ( .A(n2305), .B(n2532), .Y(n1371) );
  AND2X2 U1869 ( .A(n1469), .B(n1468), .Y(n1374) );
  CLKAND2X8 U1870 ( .A(n1736), .B(STRING[181]), .Y(n1375) );
  NAND2X4 U1871 ( .A(n2232), .B(n2198), .Y(n1377) );
  AND3X4 U1872 ( .A(n1836), .B(n1835), .C(n1834), .Y(n1378) );
  CLKBUFX3 U1873 ( .A(n2486), .Y(n2487) );
  NAND4X1 U1874 ( .A(n1891), .B(n2617), .C(n2722), .D(n1890), .Y(n1892) );
  AOI21X1 U1875 ( .A0(n1880), .A1(n1879), .B0(n2357), .Y(n1881) );
  AOI21X1 U1876 ( .A0(n1794), .A1(PATTERN[9]), .B0(n1448), .Y(n1451) );
  AOI22X1 U1877 ( .A0(n2311), .A1(n1905), .B0(n1976), .B1(n1904), .Y(n1914) );
  NOR2X4 U1878 ( .A(n1426), .B(n1425), .Y(n1429) );
  NOR2X2 U1879 ( .A(n2552), .B(str_start_idx[4]), .Y(n1907) );
  CLKBUFX3 U1880 ( .A(n1851), .Y(n2025) );
  NOR2X1 U1881 ( .A(n2576), .B(n2575), .Y(n2582) );
  NAND2BX1 U1882 ( .AN(n2386), .B(n2367), .Y(n2113) );
  NAND2BX1 U1883 ( .AN(n2386), .B(n2370), .Y(n2137) );
  NAND2X1 U1884 ( .A(n1377), .B(STRING[75]), .Y(n2396) );
  NAND2X1 U1885 ( .A(n1369), .B(STRING[69]), .Y(n2479) );
  NAND2X1 U1886 ( .A(n2485), .B(STRING[113]), .Y(n2387) );
  NAND2X1 U1887 ( .A(n2485), .B(STRING[114]), .Y(n2407) );
  NAND2X1 U1888 ( .A(STRING[248]), .B(n2472), .Y(n2403) );
  NAND2X1 U1889 ( .A(n2429), .B(STRING[193]), .Y(n2390) );
  NAND2X1 U1890 ( .A(STRING[252]), .B(n2472), .Y(n2412) );
  BUFX4 U1891 ( .A(n2085), .Y(n2180) );
  MXI2X1 U1892 ( .A(n2447), .B(n2656), .S0(n2451), .Y(n1079) );
  MXI2X1 U1893 ( .A(n2447), .B(n2596), .S0(n2454), .Y(n1095) );
  OAI21XL U1894 ( .A0(n2165), .A1(n2699), .B0(n2064), .Y(n1175) );
  OAI2BB1X1 U1895 ( .A0N(PATTERN[50]), .A1N(n2351), .B0(n2330), .Y(n869) );
  OAI21X1 U1896 ( .A0(n1218), .A1(n2388), .B0(n2380), .Y(n961) );
  OAI21XL U1897 ( .A0(n2177), .A1(n2651), .B0(n2092), .Y(n1142) );
  OAI21XL U1898 ( .A0(n2180), .A1(n2641), .B0(n2093), .Y(n1151) );
  BUFX20 U1899 ( .A(pat_match_count[1]), .Y(n2486) );
  BUFX20 U1900 ( .A(pat_match_count[0]), .Y(n2036) );
  INVX12 U1901 ( .A(n2036), .Y(n1379) );
  INVX16 U1902 ( .A(n1383), .Y(n1790) );
  NAND2X8 U1903 ( .A(n2036), .B(n2486), .Y(n1847) );
  NOR2X8 U1904 ( .A(n1847), .B(n2609), .Y(n1437) );
  BUFX16 U1905 ( .A(n1437), .Y(n2031) );
  NAND2X6 U1906 ( .A(n2031), .B(PATTERN[6]), .Y(n1380) );
  OAI21X4 U1907 ( .A0(n1790), .A1(n2716), .B0(n1380), .Y(n1472) );
  NOR2X8 U1908 ( .A(n2036), .B(n2701), .Y(n1839) );
  INVX8 U1909 ( .A(n1417), .Y(n1389) );
  AOI22X4 U1910 ( .A0(n1389), .A1(PATTERN[34]), .B0(n1437), .B1(PATTERN[2]), 
        .Y(n1387) );
  NOR2X2 U1911 ( .A(n1430), .B(n2704), .Y(n1382) );
  NOR2X2 U1912 ( .A(n1407), .B(n2610), .Y(n1381) );
  NOR2X2 U1913 ( .A(n1382), .B(n1381), .Y(n1386) );
  NAND2X2 U1914 ( .A(n1418), .B(PATTERN[57]), .Y(n1385) );
  NAND4X4 U1915 ( .A(n1387), .B(n1386), .C(n1385), .D(n1384), .Y(n1777) );
  NOR2X8 U1916 ( .A(n1388), .B(n1777), .Y(n1415) );
  NAND2X2 U1917 ( .A(n1389), .B(PATTERN[36]), .Y(n1393) );
  NAND2X2 U1918 ( .A(n1794), .B(PATTERN[20]), .Y(n1392) );
  NAND2X2 U1919 ( .A(n1791), .B(PATTERN[12]), .Y(n1391) );
  NAND4X4 U1920 ( .A(n1393), .B(n1392), .C(n1391), .D(n1390), .Y(n1467) );
  NAND2X2 U1921 ( .A(n1791), .B(PATTERN[14]), .Y(n1397) );
  INVX16 U1922 ( .A(n1422), .Y(n1793) );
  NAND2X2 U1923 ( .A(n1793), .B(PATTERN[46]), .Y(n1396) );
  NAND2X2 U1924 ( .A(n1794), .B(PATTERN[22]), .Y(n1395) );
  NAND2X2 U1925 ( .A(n1447), .B(PATTERN[54]), .Y(n1394) );
  NAND4X4 U1926 ( .A(n1397), .B(n1396), .C(n1395), .D(n1394), .Y(n1474) );
  AOI22X4 U1927 ( .A0(n1299), .A1(PATTERN[32]), .B0(n1437), .B1(PATTERN[0]), 
        .Y(n1400) );
  NAND2X2 U1928 ( .A(n1418), .B(PATTERN[56]), .Y(n1398) );
  NAND2X2 U1929 ( .A(n2031), .B(PATTERN[4]), .Y(n1404) );
  NAND2X2 U1930 ( .A(n1793), .B(PATTERN[44]), .Y(n1403) );
  NAND2X2 U1931 ( .A(n1418), .B(PATTERN[58]), .Y(n1402) );
  NAND2X2 U1932 ( .A(n1447), .B(PATTERN[52]), .Y(n1401) );
  NAND4X4 U1933 ( .A(n1404), .B(n1403), .C(n1402), .D(n1401), .Y(n1466) );
  NOR2X2 U1934 ( .A(n1422), .B(n2702), .Y(n1406) );
  BUFX12 U1935 ( .A(n1439), .Y(n1431) );
  NOR2X4 U1936 ( .A(n1431), .B(n2703), .Y(n1405) );
  NOR2X4 U1937 ( .A(n1406), .B(n1405), .Y(n1800) );
  NOR2X2 U1938 ( .A(n1407), .B(n2611), .Y(n1408) );
  NAND2X4 U1939 ( .A(n1800), .B(n1786), .Y(n1411) );
  OAI22X2 U1940 ( .A0(n1422), .A1(n2621), .B0(n1439), .B1(n2711), .Y(n1776) );
  NAND2X4 U1941 ( .A(n1389), .B(PATTERN[38]), .Y(n1410) );
  OAI21X4 U1942 ( .A0(n1476), .A1(n2708), .B0(n1410), .Y(n1473) );
  NOR3X4 U1943 ( .A(n1411), .B(n1776), .C(n1473), .Y(n1412) );
  INVX3 U1944 ( .A(n1437), .Y(n1416) );
  OA22X4 U1945 ( .A0(n1417), .A1(n1366), .B0(n1416), .B1(n1376), .Y(n1421) );
  NAND2X2 U1946 ( .A(n1418), .B(PATTERN[59]), .Y(n1419) );
  NAND3X4 U1947 ( .A(n1421), .B(n1420), .C(n1419), .Y(n1424) );
  OAI22X2 U1948 ( .A0(n1422), .A1(n2612), .B0(n1431), .B1(n2705), .Y(n1423) );
  NOR2X4 U1949 ( .A(n1424), .B(n1423), .Y(n1785) );
  OAI22X4 U1950 ( .A0(n1431), .A1(n2614), .B0(n1430), .B1(n2712), .Y(n1426) );
  OAI22X4 U1951 ( .A0(n1790), .A1(n2719), .B0(n1476), .B1(n2624), .Y(n1425) );
  AOI22X2 U1952 ( .A0(n1793), .A1(PATTERN[41]), .B0(n2031), .B1(PATTERN[1]), 
        .Y(n1427) );
  NAND3X4 U1953 ( .A(n1429), .B(n1428), .C(n1427), .Y(n1454) );
  OAI22X4 U1954 ( .A0(n1431), .A1(n2613), .B0(n1430), .B1(n2710), .Y(n1433) );
  OAI22X4 U1955 ( .A0(n1790), .A1(n2714), .B0(n1476), .B1(n2622), .Y(n1432) );
  AOI22X2 U1956 ( .A0(n1794), .A1(PATTERN[19]), .B0(n1449), .B1(PATTERN[35]), 
        .Y(n1435) );
  AOI22X2 U1957 ( .A0(n1793), .A1(PATTERN[43]), .B0(n1437), .B1(PATTERN[3]), 
        .Y(n1434) );
  NAND3X6 U1958 ( .A(n1436), .B(n1435), .C(n1434), .Y(n1482) );
  OAI22X4 U1959 ( .A0(n1790), .A1(n2715), .B0(n1476), .B1(n2623), .Y(n1441) );
  NAND2X2 U1960 ( .A(n1437), .B(PATTERN[5]), .Y(n1438) );
  OAI21X2 U1961 ( .A0(n1439), .A1(n2615), .B0(n1438), .Y(n1440) );
  BUFX8 U1962 ( .A(n1447), .Y(n1792) );
  AOI22X1 U1963 ( .A0(n1792), .A1(PATTERN[41]), .B0(n1791), .B1(PATTERN[1]), 
        .Y(n1452) );
  OAI22X1 U1964 ( .A0(n1790), .A1(n2614), .B0(n1476), .B1(n2737), .Y(n1448) );
  BUFX12 U1965 ( .A(n1299), .Y(n1846) );
  AOI22X1 U1966 ( .A0(n1793), .A1(PATTERN[33]), .B0(n1846), .B1(PATTERN[25]), 
        .Y(n1450) );
  AND3X4 U1967 ( .A(n1452), .B(n1451), .C(n1450), .Y(n1453) );
  NAND2X6 U1968 ( .A(n1258), .B(n1453), .Y(n1456) );
  BUFX2 U1969 ( .A(n1454), .Y(n1455) );
  INVX12 U1970 ( .A(n1811), .Y(n1834) );
  OAI22X1 U1971 ( .A0(n1790), .A1(n2615), .B0(n1476), .B1(n2728), .Y(n1457) );
  AOI21X1 U1972 ( .A0(n1794), .A1(PATTERN[13]), .B0(n1457), .Y(n1460) );
  AOI22X1 U1973 ( .A0(n1792), .A1(PATTERN[45]), .B0(n1791), .B1(PATTERN[5]), 
        .Y(n1458) );
  NAND2BX4 U1974 ( .AN(n1367), .B(n1458), .Y(n1459) );
  NOR2BX4 U1975 ( .AN(n1460), .B(n1459), .Y(n1461) );
  NAND2X6 U1976 ( .A(n1461), .B(n1258), .Y(n1462) );
  OAI22X1 U1977 ( .A0(n1790), .A1(n2634), .B0(n1476), .B1(n2727), .Y(n1465) );
  AOI22X1 U1978 ( .A0(n1792), .A1(PATTERN[44]), .B0(n1791), .B1(PATTERN[4]), 
        .Y(n1464) );
  NAND2X1 U1979 ( .A(n1794), .B(PATTERN[12]), .Y(n1463) );
  INVX1 U1980 ( .A(n1466), .Y(n1469) );
  INVX1 U1981 ( .A(n1467), .Y(n1468) );
  AOI22X1 U1982 ( .A0(n1793), .A1(PATTERN[38]), .B0(n1846), .B1(PATTERN[30]), 
        .Y(n1471) );
  NAND2X1 U1983 ( .A(n1794), .B(PATTERN[14]), .Y(n1470) );
  NOR3X1 U1984 ( .A(n1474), .B(n1473), .C(n1472), .Y(n1475) );
  OAI22X1 U1985 ( .A0(n1790), .A1(n2613), .B0(n1476), .B1(n2726), .Y(n1477) );
  AOI21X1 U1986 ( .A0(n1794), .A1(PATTERN[11]), .B0(n1477), .Y(n1480) );
  AOI22X1 U1987 ( .A0(n1792), .A1(PATTERN[43]), .B0(n1791), .B1(PATTERN[3]), 
        .Y(n1479) );
  AOI22X1 U1988 ( .A0(n1793), .A1(PATTERN[35]), .B0(n1846), .B1(PATTERN[27]), 
        .Y(n1478) );
  INVX3 U1989 ( .A(n1814), .Y(n1547) );
  INVX3 U1990 ( .A(str_start_idx[0]), .Y(n1485) );
  INVX8 U1991 ( .A(n2036), .Y(n1484) );
  NAND2X4 U1992 ( .A(n1485), .B(n1484), .Y(n1486) );
  AND2X8 U1993 ( .A(n1486), .B(n1315), .Y(n2521) );
  OR2X8 U1994 ( .A(n2520), .B(n2521), .Y(n1499) );
  INVX8 U1995 ( .A(n1499), .Y(n1489) );
  BUFX20 U1996 ( .A(n1488), .Y(n2524) );
  INVX8 U1997 ( .A(n2521), .Y(n1537) );
  NAND2X8 U1998 ( .A(n1537), .B(n2520), .Y(n1500) );
  INVX6 U1999 ( .A(n1500), .Y(n1491) );
  INVX20 U2000 ( .A(n1516), .Y(n1757) );
  OAI22X4 U2001 ( .A0(n1722), .A1(n2594), .B0(n1757), .B1(n2648), .Y(n1498) );
  NAND2X8 U2002 ( .A(n1493), .B(n2524), .Y(n1494) );
  INVX20 U2003 ( .A(n1528), .Y(n1731) );
  NAND2X8 U2004 ( .A(n1495), .B(n2524), .Y(n1496) );
  INVX20 U2005 ( .A(n1515), .Y(n1759) );
  OAI22X4 U2006 ( .A0(n1731), .A1(n2592), .B0(n1759), .B1(n2644), .Y(n1497) );
  NOR2X4 U2007 ( .A(n1498), .B(n1497), .Y(n1503) );
  NOR2X8 U2008 ( .A(n2524), .B(n1500), .Y(n1725) );
  BUFX20 U2009 ( .A(n1725), .Y(n1750) );
  AOI22X2 U2010 ( .A0(n1751), .A1(STRING[202]), .B0(n1750), .B1(STRING[186]), 
        .Y(n1502) );
  BUFX16 U2011 ( .A(n1517), .Y(n1753) );
  BUFX20 U2012 ( .A(n1550), .Y(n1736) );
  AOI22X2 U2013 ( .A0(n1753), .A1(STRING[194]), .B0(n1736), .B1(STRING[178]), 
        .Y(n1501) );
  NAND2X2 U2014 ( .A(str_start_idx[3]), .B(pat_match_count[3]), .Y(n1510) );
  OAI21X4 U2015 ( .A0(n1511), .A1(n1507), .B0(n1510), .Y(n1504) );
  XOR2X4 U2016 ( .A(n1505), .B(n2618), .Y(n1525) );
  NOR2X4 U2017 ( .A(n1505), .B(n2618), .Y(n1506) );
  NAND2BX2 U2018 ( .AN(n1511), .B(n1510), .Y(n1512) );
  XNOR2X4 U2019 ( .A(n1513), .B(n1512), .Y(n2517) );
  INVX3 U2020 ( .A(n2517), .Y(n1514) );
  INVX12 U2021 ( .A(n1528), .Y(n1760) );
  INVX20 U2022 ( .A(n1516), .Y(n1732) );
  NAND2X2 U2023 ( .A(n1751), .B(STRING[76]), .Y(n1521) );
  BUFX20 U2024 ( .A(n1517), .Y(n1734) );
  NAND2X4 U2025 ( .A(n1734), .B(STRING[68]), .Y(n1520) );
  NAND2X1 U2026 ( .A(n1725), .B(STRING[60]), .Y(n1519) );
  NAND2X2 U2027 ( .A(n1736), .B(STRING[52]), .Y(n1518) );
  BUFX4 U2028 ( .A(n1525), .Y(n2516) );
  NAND2X4 U2029 ( .A(n1526), .B(n2516), .Y(n1568) );
  INVX16 U2030 ( .A(n1527), .Y(n1746) );
  OAI22X2 U2031 ( .A0(n2775), .A1(n1746), .B0(n1757), .B1(n2687), .Y(n1530) );
  OAI22X2 U2032 ( .A0(n2765), .A1(n1747), .B0(n1759), .B1(n2677), .Y(n1529) );
  NOR2X4 U2033 ( .A(n1530), .B(n1529), .Y(n1535) );
  BUFX16 U2034 ( .A(n1531), .Y(n1724) );
  CLKINVX3 U2035 ( .A(n1750), .Y(n1532) );
  AOI2BB2X4 U2036 ( .B0(STRING[140]), .B1(n1724), .A0N(n1532), .A1N(n1365), 
        .Y(n1534) );
  AOI22X4 U2037 ( .A0(STRING[132]), .A1(n1734), .B0(n1235), .B1(STRING[116]), 
        .Y(n1533) );
  NOR2X8 U2038 ( .A(n2529), .B(n2517), .Y(n1545) );
  NAND2X4 U2039 ( .A(n1545), .B(n2516), .Y(n1536) );
  INVX12 U2040 ( .A(n1536), .Y(n1744) );
  OAI22X2 U2041 ( .A0(n1742), .A1(n2692), .B0(n1741), .B1(n2608), .Y(n1538) );
  OAI22X2 U2042 ( .A0(n2750), .A1(n1760), .B0(n1759), .B1(n2660), .Y(n1539) );
  NOR2X4 U2043 ( .A(n1540), .B(n1539), .Y(n1543) );
  NAND2X1 U2044 ( .A(n1750), .B(STRING[242]), .Y(n1542) );
  AOI22X2 U2045 ( .A0(n1753), .A1(STRING[250]), .B0(n1752), .B1(STRING[234]), 
        .Y(n1541) );
  NAND2X6 U2046 ( .A(n1545), .B(n1544), .Y(n1546) );
  INVX12 U2047 ( .A(n1546), .Y(n1709) );
  OAI22X4 U2048 ( .A0(n1746), .A1(n2755), .B0(n1732), .B1(n2664), .Y(n1549) );
  BUFX20 U2049 ( .A(n1550), .Y(n1752) );
  NAND2X2 U2050 ( .A(n1751), .B(STRING[203]), .Y(n1554) );
  NAND2X4 U2051 ( .A(n1734), .B(STRING[195]), .Y(n1553) );
  BUFX20 U2052 ( .A(n1725), .Y(n1735) );
  NAND2X2 U2053 ( .A(n1735), .B(STRING[187]), .Y(n1552) );
  BUFX16 U2054 ( .A(n1550), .Y(n1713) );
  OAI22X4 U2055 ( .A0(n1722), .A1(n2768), .B0(n1732), .B1(n2683), .Y(n1556) );
  OR2X4 U2056 ( .A(n1556), .B(n1555), .Y(n1557) );
  AOI21X2 U2057 ( .A0(n1750), .A1(STRING[243]), .B0(n1751), .Y(n1561) );
  AOI22X2 U2058 ( .A0(n1734), .A1(STRING[251]), .B0(n1713), .B1(STRING[235]), 
        .Y(n1560) );
  INVX6 U2059 ( .A(n1722), .Y(n1563) );
  AOI2BB2X4 U2060 ( .B0(n1563), .B1(STRING[227]), .A0N(n1732), .A1N(n2754), 
        .Y(n1559) );
  AOI2BB2X4 U2061 ( .B0(n1562), .B1(STRING[221]), .A0N(n1759), .A1N(n2753), 
        .Y(n1558) );
  AOI22X2 U2062 ( .A0(n1751), .A1(STRING[77]), .B0(n1750), .B1(STRING[61]), 
        .Y(n1567) );
  AOI2BB2X4 U2063 ( .B0(n1562), .B1(STRING[37]), .A0N(n1759), .A1N(n2635), .Y(
        n1566) );
  AOI2BB2X4 U2064 ( .B0(n1563), .B1(STRING[45]), .A0N(n1732), .A1N(n2774), .Y(
        n1565) );
  AOI22X2 U2065 ( .A0(n1753), .A1(STRING[69]), .B0(n1736), .B1(STRING[53]), 
        .Y(n1564) );
  INVX3 U2066 ( .A(n1823), .Y(n1600) );
  OAI22X4 U2067 ( .A0(n1722), .A1(n2645), .B0(n1757), .B1(n2738), .Y(n1569) );
  AOI22X2 U2068 ( .A0(n1751), .A1(STRING[201]), .B0(n1750), .B1(STRING[185]), 
        .Y(n1572) );
  AOI22X2 U2069 ( .A0(n1734), .A1(STRING[193]), .B0(n1752), .B1(STRING[177]), 
        .Y(n1571) );
  NAND3X4 U2070 ( .A(n1573), .B(n1572), .C(n1571), .Y(n1581) );
  NAND2X2 U2071 ( .A(n1735), .B(STRING[241]), .Y(n1576) );
  NAND2X4 U2072 ( .A(n1734), .B(STRING[249]), .Y(n1575) );
  NAND2X4 U2073 ( .A(n1713), .B(STRING[233]), .Y(n1574) );
  OAI22X4 U2074 ( .A0(n2629), .A1(n1731), .B0(n1759), .B1(n2718), .Y(n1578) );
  OAI22X4 U2075 ( .A0(n2724), .A1(n1758), .B0(n1732), .B1(n1368), .Y(n1577) );
  NOR3X4 U2076 ( .A(n1579), .B(n1578), .C(n1577), .Y(n1580) );
  AOI2BB2X4 U2077 ( .B0(n1581), .B1(n1733), .A0N(n1580), .A1N(n1224), .Y(n1599) );
  OAI22X4 U2078 ( .A0(n2757), .A1(n1758), .B0(n1732), .B1(n2590), .Y(n1583) );
  AOI22X2 U2079 ( .A0(STRING[75]), .A1(n1751), .B0(n1750), .B1(STRING[59]), 
        .Y(n1585) );
  AOI22X2 U2080 ( .A0(STRING[67]), .A1(n1734), .B0(n1713), .B1(STRING[51]), 
        .Y(n1584) );
  OAI22X2 U2081 ( .A0(n2721), .A1(n1758), .B0(n1757), .B1(n2617), .Y(n1588) );
  OAI22X2 U2082 ( .A0(n2709), .A1(n1760), .B0(n1759), .B1(n2616), .Y(n1587) );
  NOR2X2 U2083 ( .A(n1588), .B(n1587), .Y(n1589) );
  AOI2BB2X4 U2084 ( .B0(n1590), .B1(n1764), .A0N(n1589), .A1N(n1763), .Y(n1598) );
  NAND2X1 U2085 ( .A(n1751), .B(STRING[139]), .Y(n1594) );
  NAND2X2 U2086 ( .A(n1734), .B(STRING[131]), .Y(n1593) );
  NAND2X2 U2087 ( .A(n1713), .B(STRING[115]), .Y(n1591) );
  NAND4X2 U2088 ( .A(n1594), .B(n1593), .C(n1592), .D(n1591), .Y(n1596) );
  OAI22X2 U2089 ( .A0(n1742), .A1(n2668), .B0(n1741), .B1(n2756), .Y(n1595) );
  AOI21X4 U2090 ( .A0(n1744), .A1(n1596), .B0(n1595), .Y(n1597) );
  NOR2X6 U2091 ( .A(n1600), .B(n1815), .Y(n1630) );
  AOI22X2 U2092 ( .A0(STRING[73]), .A1(n1724), .B0(n1735), .B1(STRING[57]), 
        .Y(n1605) );
  OAI22X4 U2093 ( .A0(n2769), .A1(n1746), .B0(n1732), .B1(n2682), .Y(n1601) );
  NOR2X4 U2094 ( .A(n1602), .B(n1601), .Y(n1604) );
  AOI22X2 U2095 ( .A0(STRING[65]), .A1(n1753), .B0(n1713), .B1(STRING[49]), 
        .Y(n1603) );
  NAND2X2 U2096 ( .A(n1752), .B(STRING[175]), .Y(n1607) );
  NAND4X4 U2097 ( .A(n1609), .B(n1608), .C(n1607), .D(n1606), .Y(n1611) );
  OAI22X2 U2098 ( .A0(n1747), .A1(n2673), .B0(n1759), .B1(n2758), .Y(n1610) );
  AOI2BB2X4 U2099 ( .B0(n1613), .B1(n1764), .A0N(n1612), .A1N(n1225), .Y(n1628) );
  OAI22X2 U2100 ( .A0(n2746), .A1(n1746), .B0(n1732), .B1(n2657), .Y(n1614) );
  NOR2X2 U2101 ( .A(n1614), .B(n1615), .Y(n1618) );
  NAND2X1 U2102 ( .A(n1648), .B(STRING[239]), .Y(n1617) );
  AOI22X1 U2103 ( .A0(n1753), .A1(STRING[247]), .B0(n1736), .B1(STRING[231]), 
        .Y(n1616) );
  NAND3X2 U2104 ( .A(n1618), .B(n1617), .C(n1616), .Y(n1619) );
  NAND2X4 U2105 ( .A(n1619), .B(n1709), .Y(n1627) );
  OAI22X2 U2106 ( .A0(n2760), .A1(n1731), .B0(n1356), .B1(n2670), .Y(n1621) );
  OAI22X2 U2107 ( .A0(n2773), .A1(n1746), .B0(n1757), .B1(n2672), .Y(n1620) );
  AOI22X2 U2108 ( .A0(STRING[137]), .A1(n1724), .B0(n1735), .B1(STRING[121]), 
        .Y(n1623) );
  AOI22X2 U2109 ( .A0(STRING[129]), .A1(n1753), .B0(n1752), .B1(STRING[113]), 
        .Y(n1622) );
  OAI22X2 U2110 ( .A0(n1742), .A1(n2777), .B0(n1741), .B1(n2691), .Y(n1624) );
  AOI21X4 U2111 ( .A0(n1625), .A1(n1744), .B0(n1624), .Y(n1626) );
  NAND3X6 U2112 ( .A(n1627), .B(n1628), .C(n1626), .Y(n1813) );
  INVX3 U2113 ( .A(n1813), .Y(n1629) );
  NAND3X6 U2114 ( .A(n1631), .B(n1630), .C(n1629), .Y(n1770) );
  OAI22X2 U2115 ( .A0(n2767), .A1(n1746), .B0(n1732), .B1(n2681), .Y(n1633) );
  AOI22X2 U2116 ( .A0(STRING[78]), .A1(n1724), .B0(n1750), .B1(STRING[62]), 
        .Y(n1635) );
  AOI22X2 U2117 ( .A0(STRING[70]), .A1(n1734), .B0(n1736), .B1(STRING[54]), 
        .Y(n1634) );
  NAND3X4 U2118 ( .A(n1636), .B(n1635), .C(n1634), .Y(n1645) );
  NAND2X2 U2119 ( .A(n1734), .B(STRING[196]), .Y(n1640) );
  NAND2X2 U2120 ( .A(n1713), .B(STRING[180]), .Y(n1639) );
  NAND2X2 U2121 ( .A(n1735), .B(STRING[188]), .Y(n1638) );
  NAND2X2 U2122 ( .A(n1724), .B(STRING[204]), .Y(n1637) );
  OAI22X2 U2123 ( .A0(n1722), .A1(n2603), .B0(n1757), .B1(n2676), .Y(n1642) );
  OAI22X2 U2124 ( .A0(n1731), .A1(n2601), .B0(n1356), .B1(n2663), .Y(n1641) );
  NOR3X2 U2125 ( .A(n1643), .B(n1642), .C(n1641), .Y(n1644) );
  AOI2BB2X4 U2126 ( .B0(n1645), .B1(n1764), .A0N(n1644), .A1N(n1225), .Y(n1662) );
  OAI22X2 U2127 ( .A0(n2772), .A1(n1722), .B0(n1732), .B1(n2686), .Y(n1647) );
  OAI22X2 U2128 ( .A0(n2759), .A1(n1760), .B0(n1759), .B1(n2667), .Y(n1646) );
  NOR2X4 U2129 ( .A(n1647), .B(n1646), .Y(n1651) );
  AOI22X4 U2130 ( .A0(STRING[142]), .A1(n1724), .B0(n1648), .B1(STRING[126]), 
        .Y(n1650) );
  AOI22X2 U2131 ( .A0(STRING[134]), .A1(n1753), .B0(n1752), .B1(STRING[118]), 
        .Y(n1649) );
  NAND3X4 U2132 ( .A(n1651), .B(n1650), .C(n1649), .Y(n1653) );
  OAI22X2 U2133 ( .A0(n1742), .A1(n2776), .B0(n1741), .B1(n2689), .Y(n1652) );
  AOI21X4 U2134 ( .A0(n1653), .A1(n1744), .B0(n1652), .Y(n1661) );
  OAI22X2 U2135 ( .A0(n2745), .A1(n1746), .B0(n1732), .B1(n2654), .Y(n1655) );
  NOR2X2 U2136 ( .A(n1655), .B(n1654), .Y(n1658) );
  AOI22X1 U2137 ( .A0(n1734), .A1(STRING[252]), .B0(n1713), .B1(STRING[236]), 
        .Y(n1656) );
  NAND3X2 U2138 ( .A(n1658), .B(n1657), .C(n1656), .Y(n1659) );
  NAND2X4 U2139 ( .A(n1659), .B(n1709), .Y(n1660) );
  NOR2X4 U2140 ( .A(n1664), .B(n1663), .Y(n1667) );
  AOI22X2 U2141 ( .A0(STRING[79]), .A1(n1751), .B0(n1750), .B1(STRING[63]), 
        .Y(n1666) );
  AOI22X2 U2142 ( .A0(STRING[71]), .A1(n1753), .B0(n1736), .B1(STRING[55]), 
        .Y(n1665) );
  NAND3X2 U2143 ( .A(n1667), .B(n1666), .C(n1665), .Y(n1675) );
  NOR2X8 U2144 ( .A(n1375), .B(n1373), .Y(n1670) );
  NAND2X2 U2145 ( .A(n1753), .B(STRING[197]), .Y(n1669) );
  NAND2X2 U2146 ( .A(n1724), .B(STRING[205]), .Y(n1668) );
  NAND3X6 U2147 ( .A(n1670), .B(n1669), .C(n1668), .Y(n1672) );
  OAI22X2 U2148 ( .A0(n2733), .A1(n1758), .B0(n1757), .B1(n2641), .Y(n1677) );
  NOR2X2 U2149 ( .A(n1677), .B(n1676), .Y(n1680) );
  NAND2X1 U2150 ( .A(n1648), .B(STRING[245]), .Y(n1679) );
  NAND3X2 U2151 ( .A(n1680), .B(n1679), .C(n1678), .Y(n1681) );
  OAI22X2 U2152 ( .A0(n2747), .A1(n1746), .B0(n1732), .B1(n2655), .Y(n1683) );
  AOI22X2 U2153 ( .A0(STRING[143]), .A1(n1751), .B0(n1750), .B1(STRING[127]), 
        .Y(n1685) );
  AOI22X2 U2154 ( .A0(STRING[135]), .A1(n1753), .B0(n1713), .B1(STRING[119]), 
        .Y(n1684) );
  OAI22X2 U2155 ( .A0(n1742), .A1(n2688), .B0(n1741), .B1(n2606), .Y(n1686) );
  AOI21X4 U2156 ( .A0(n1687), .A1(n1744), .B0(n1686), .Y(n1688) );
  INVX3 U2157 ( .A(n1818), .Y(n1768) );
  OAI22X4 U2158 ( .A0(n2605), .A1(n1746), .B0(n1732), .B1(n2588), .Y(n1691) );
  NOR2X4 U2159 ( .A(n1691), .B(n1690), .Y(n1694) );
  AOI22X2 U2160 ( .A0(STRING[74]), .A1(n1751), .B0(n1750), .B1(STRING[58]), 
        .Y(n1693) );
  AOI22X2 U2161 ( .A0(STRING[66]), .A1(n1734), .B0(n1713), .B1(STRING[50]), 
        .Y(n1692) );
  NAND3X2 U2162 ( .A(n1694), .B(n1693), .C(n1692), .Y(n1703) );
  NAND2X2 U2163 ( .A(n1753), .B(STRING[192]), .Y(n1698) );
  NAND2X2 U2164 ( .A(n1724), .B(STRING[200]), .Y(n1697) );
  NAND2X2 U2165 ( .A(n1735), .B(STRING[184]), .Y(n1696) );
  NAND2X2 U2166 ( .A(n1752), .B(STRING[176]), .Y(n1695) );
  NAND4X4 U2167 ( .A(n1698), .B(n1697), .C(n1696), .D(n1695), .Y(n1701) );
  OAI22X4 U2168 ( .A0(n1722), .A1(n2752), .B0(n1757), .B1(n2633), .Y(n1700) );
  NOR3X4 U2169 ( .A(n1701), .B(n1700), .C(n1699), .Y(n1702) );
  AOI2BB2X4 U2170 ( .B0(n1703), .B1(n1764), .A0N(n1702), .A1N(n1225), .Y(n1721) );
  NAND2X1 U2171 ( .A(n1750), .B(STRING[240]), .Y(n1707) );
  OAI22X2 U2172 ( .A0(n1758), .A1(n2669), .B0(n1757), .B1(n2599), .Y(n1712) );
  NOR2X4 U2173 ( .A(n1712), .B(n1711), .Y(n1716) );
  AOI22X2 U2174 ( .A0(STRING[138]), .A1(n1724), .B0(n1750), .B1(STRING[122]), 
        .Y(n1715) );
  AOI22X2 U2175 ( .A0(STRING[130]), .A1(n1734), .B0(n1713), .B1(STRING[114]), 
        .Y(n1714) );
  OAI22X2 U2176 ( .A0(n1742), .A1(n2690), .B0(n1741), .B1(n2607), .Y(n1717) );
  AOI21X4 U2177 ( .A0(n1718), .A1(n1744), .B0(n1717), .Y(n1719) );
  NAND3X6 U2178 ( .A(n1721), .B(n1719), .C(n1720), .Y(n1820) );
  INVX3 U2179 ( .A(n1724), .Y(n1727) );
  CLKINVX1 U2180 ( .A(n1725), .Y(n1726) );
  NAND2X4 U2181 ( .A(n1734), .B(STRING[246]), .Y(n1730) );
  NAND2X2 U2182 ( .A(n1735), .B(STRING[238]), .Y(n1729) );
  NAND2X2 U2183 ( .A(n1736), .B(STRING[230]), .Y(n1728) );
  NAND2X1 U2184 ( .A(n1751), .B(STRING[136]), .Y(n1740) );
  NAND2X2 U2185 ( .A(n1734), .B(STRING[128]), .Y(n1739) );
  NAND2X2 U2186 ( .A(n1735), .B(STRING[120]), .Y(n1738) );
  NAND2X2 U2187 ( .A(n1736), .B(STRING[112]), .Y(n1737) );
  NAND4X2 U2188 ( .A(n1740), .B(n1739), .C(n1738), .D(n1737), .Y(n1745) );
  AOI21X4 U2189 ( .A0(n1745), .A1(n1744), .B0(n1743), .Y(n1765) );
  OAI22X4 U2190 ( .A0(n2761), .A1(n1746), .B0(n1757), .B1(n2631), .Y(n1749) );
  OAI22X4 U2191 ( .A0(n2717), .A1(n1747), .B0(n1759), .B1(n2625), .Y(n1748) );
  NOR2X4 U2192 ( .A(n1749), .B(n1748), .Y(n1756) );
  AOI22X2 U2193 ( .A0(STRING[72]), .A1(n1751), .B0(n1750), .B1(STRING[56]), 
        .Y(n1755) );
  AOI22X2 U2194 ( .A0(STRING[64]), .A1(n1753), .B0(n1752), .B1(STRING[48]), 
        .Y(n1754) );
  OAI22X2 U2195 ( .A0(n2630), .A1(n1758), .B0(n1757), .B1(n2722), .Y(n1762) );
  OAI22X2 U2196 ( .A0(n2619), .A1(n1760), .B0(n1759), .B1(n2707), .Y(n1761) );
  INVX3 U2197 ( .A(n1825), .Y(n1766) );
  NAND4BX4 U2198 ( .AN(n1807), .B(n1768), .C(n1767), .D(n1766), .Y(n1769) );
  NOR2X8 U2199 ( .A(n1770), .B(n1769), .Y(n1842) );
  OAI22X1 U2200 ( .A0(n1790), .A1(n2711), .B0(n1476), .B1(n2610), .Y(n1774) );
  AOI22X1 U2201 ( .A0(n1792), .A1(PATTERN[42]), .B0(n1791), .B1(PATTERN[2]), 
        .Y(n1773) );
  AOI22X1 U2202 ( .A0(n1793), .A1(PATTERN[34]), .B0(n1846), .B1(PATTERN[26]), 
        .Y(n1772) );
  NAND2X1 U2203 ( .A(n1794), .B(PATTERN[10]), .Y(n1771) );
  NOR2X1 U2204 ( .A(n1777), .B(n1776), .Y(n1778) );
  OAI22X1 U2205 ( .A0(n1790), .A1(n2705), .B0(n1476), .B1(n2611), .Y(n1783) );
  AOI22X1 U2206 ( .A0(n1793), .A1(PATTERN[39]), .B0(n1846), .B1(PATTERN[31]), 
        .Y(n1781) );
  NAND2X1 U2207 ( .A(n1794), .B(PATTERN[15]), .Y(n1780) );
  NAND4BX2 U2208 ( .AN(n1783), .B(n1782), .C(n1781), .D(n1780), .Y(n1784) );
  INVX1 U2209 ( .A(n1785), .Y(n1788) );
  CLKINVX1 U2210 ( .A(n1786), .Y(n1787) );
  NOR2X1 U2211 ( .A(n1788), .B(n1787), .Y(n1789) );
  OAI22X1 U2212 ( .A0(n1790), .A1(n2703), .B0(n1476), .B1(n2626), .Y(n1798) );
  AOI22X1 U2213 ( .A0(n1792), .A1(PATTERN[40]), .B0(n1791), .B1(PATTERN[0]), 
        .Y(n1797) );
  AOI22X1 U2214 ( .A0(n1793), .A1(PATTERN[32]), .B0(n1846), .B1(PATTERN[24]), 
        .Y(n1796) );
  NAND2X1 U2215 ( .A(n1794), .B(PATTERN[8]), .Y(n1795) );
  NAND4BX1 U2216 ( .AN(n1798), .B(n1797), .C(n1796), .D(n1795), .Y(n1799) );
  CLKINVX1 U2217 ( .A(n1800), .Y(n1802) );
  BUFX4 U2218 ( .A(n1805), .Y(n1806) );
  XOR2X4 U2219 ( .A(n1807), .B(n1806), .Y(n1810) );
  NOR2X8 U2220 ( .A(n1810), .B(n1809), .Y(n1831) );
  BUFX4 U2221 ( .A(n1811), .Y(n1812) );
  XNOR2X4 U2222 ( .A(n1813), .B(n1812), .Y(n1817) );
  XNOR2X4 U2223 ( .A(n1815), .B(n1814), .Y(n1816) );
  NOR2X8 U2224 ( .A(n1817), .B(n1816), .Y(n1830) );
  XOR2X4 U2225 ( .A(n1820), .B(n1819), .Y(n1821) );
  XNOR2X4 U2226 ( .A(n1823), .B(n1833), .Y(n1827) );
  XOR2X4 U2227 ( .A(n1825), .B(n1824), .Y(n1826) );
  INVX3 U2228 ( .A(n1832), .Y(n1836) );
  CLKINVX2 U2229 ( .A(n1833), .Y(n1835) );
  NAND2X1 U2230 ( .A(n1837), .B(n2532), .Y(n2511) );
  NOR2X1 U2231 ( .A(n2589), .B(n2696), .Y(n2312) );
  INVX12 U2232 ( .A(n2620), .Y(n1838) );
  CLKINVX1 U2233 ( .A(n1839), .Y(n1841) );
  OR2X8 U2234 ( .A(n1842), .B(n1378), .Y(n2304) );
  BUFX4 U2235 ( .A(n1300), .Y(n2310) );
  NAND2X4 U2236 ( .A(n2310), .B(n2532), .Y(n2513) );
  NAND2X1 U2237 ( .A(n2586), .B(check_point_idx[1]), .Y(n1845) );
  NAND2X1 U2238 ( .A(n2488), .B(n1847), .Y(n1848) );
  NAND2X1 U2239 ( .A(n2586), .B(check_point_idx[2]), .Y(n1850) );
  CLKINVX1 U2240 ( .A(n2589), .Y(n1853) );
  NAND2X1 U2241 ( .A(n2025), .B(n1238), .Y(n2358) );
  NAND2X4 U2242 ( .A(n1856), .B(n1855), .Y(n856) );
  NOR3XL U2243 ( .A(STRING[170]), .B(STRING[172]), .C(STRING[167]), .Y(n1859)
         );
  NOR4XL U2244 ( .A(STRING[173]), .B(STRING[168]), .C(STRING[166]), .D(
        STRING[169]), .Y(n1858) );
  NOR2X4 U2245 ( .A(n2589), .B(n2620), .Y(n2553) );
  OAI2BB1X1 U2246 ( .A0N(n1859), .A1N(n1858), .B0(n2311), .Y(n1885) );
  NOR3XL U2247 ( .A(STRING[202]), .B(STRING[204]), .C(STRING[199]), .Y(n1862)
         );
  NOR4X1 U2248 ( .A(STRING[205]), .B(STRING[200]), .C(STRING[198]), .D(
        STRING[201]), .Y(n1861) );
  NOR2X6 U2249 ( .A(n1864), .B(n1860), .Y(n1998) );
  OAI2BB1X1 U2250 ( .A0N(n1862), .A1N(n1861), .B0(n1998), .Y(n1876) );
  NOR3X1 U2251 ( .A(STRING[73]), .B(STRING[78]), .C(STRING[76]), .Y(n1866) );
  NOR4X1 U2252 ( .A(STRING[75]), .B(STRING[74]), .C(STRING[72]), .D(STRING[79]), .Y(n1865) );
  NAND2X2 U2253 ( .A(n1838), .B(str_start_idx[4]), .Y(n1863) );
  NOR2X6 U2254 ( .A(n1864), .B(n1863), .Y(n2000) );
  OAI2BB1X2 U2255 ( .A0N(n1866), .A1N(n1865), .B0(n2000), .Y(n1875) );
  NOR3X1 U2256 ( .A(STRING[224]), .B(STRING[228]), .C(STRING[226]), .Y(n1868)
         );
  NOR2XL U2257 ( .A(STRING[225]), .B(STRING[229]), .Y(n1867) );
  NAND4X1 U2258 ( .A(n1868), .B(n2724), .C(n2632), .D(n1867), .Y(n1869) );
  NAND2X1 U2259 ( .A(n1999), .B(n1869), .Y(n1874) );
  NOR3X4 U2260 ( .A(n1838), .B(n2589), .C(n2618), .Y(n2001) );
  NOR3X1 U2261 ( .A(STRING[105]), .B(STRING[110]), .C(STRING[108]), .Y(n1871)
         );
  NOR2X1 U2262 ( .A(STRING[106]), .B(STRING[111]), .Y(n1870) );
  NAND4X1 U2263 ( .A(n1871), .B(n2721), .C(n2630), .D(n1870), .Y(n1872) );
  NAND2X1 U2264 ( .A(n2001), .B(n1872), .Y(n1873) );
  AND4X4 U2265 ( .A(n1876), .B(n1875), .C(n1874), .D(n1873), .Y(n1884) );
  NOR3X1 U2266 ( .A(STRING[137]), .B(STRING[142]), .C(STRING[140]), .Y(n1878)
         );
  NOR4X1 U2267 ( .A(STRING[139]), .B(STRING[138]), .C(STRING[136]), .D(
        STRING[143]), .Y(n1877) );
  NOR2X4 U2268 ( .A(n1236), .B(n1838), .Y(n1906) );
  NAND2X4 U2269 ( .A(n1906), .B(str_start_idx[4]), .Y(n1997) );
  NOR3XL U2270 ( .A(STRING[41]), .B(STRING[46]), .C(STRING[44]), .Y(n1880) );
  NOR4X1 U2271 ( .A(STRING[43]), .B(STRING[42]), .C(STRING[40]), .D(STRING[47]), .Y(n1879) );
  NAND2X4 U2272 ( .A(n2553), .B(str_start_idx[4]), .Y(n2357) );
  NOR2X1 U2273 ( .A(n1882), .B(n1881), .Y(n1883) );
  NAND3X2 U2274 ( .A(n1885), .B(n1884), .C(n1883), .Y(n1917) );
  NOR3X1 U2275 ( .A(STRING[186]), .B(STRING[188]), .C(STRING[183]), .Y(n1887)
         );
  NOR4X1 U2276 ( .A(STRING[189]), .B(STRING[184]), .C(STRING[182]), .D(
        STRING[185]), .Y(n1886) );
  OAI2BB1X1 U2277 ( .A0N(n1887), .A1N(n1886), .B0(n1998), .Y(n1899) );
  NOR3XL U2278 ( .A(STRING[57]), .B(STRING[62]), .C(STRING[60]), .Y(n1889) );
  NOR4X1 U2279 ( .A(STRING[59]), .B(STRING[58]), .C(STRING[56]), .D(STRING[63]), .Y(n1888) );
  OAI2BB1X2 U2280 ( .A0N(n1889), .A1N(n1888), .B0(n2000), .Y(n1898) );
  NOR3X1 U2281 ( .A(STRING[89]), .B(STRING[94]), .C(STRING[92]), .Y(n1891) );
  NOR2X1 U2282 ( .A(STRING[90]), .B(STRING[95]), .Y(n1890) );
  NAND2X1 U2283 ( .A(n2001), .B(n1892), .Y(n1897) );
  NOR3X1 U2284 ( .A(STRING[212]), .B(STRING[216]), .C(STRING[214]), .Y(n1894)
         );
  NOR2X1 U2285 ( .A(STRING[213]), .B(STRING[217]), .Y(n1893) );
  NAND4X1 U2286 ( .A(n1894), .B(n1368), .C(n2725), .D(n1893), .Y(n1895) );
  NAND2X1 U2287 ( .A(n1999), .B(n1895), .Y(n1896) );
  NAND4X2 U2288 ( .A(n1899), .B(n1898), .C(n1897), .D(n1896), .Y(n1915) );
  NOR3X1 U2289 ( .A(STRING[155]), .B(STRING[157]), .C(STRING[153]), .Y(n1901)
         );
  NOR2XL U2290 ( .A(STRING[152]), .B(STRING[154]), .Y(n1900) );
  NAND4X1 U2291 ( .A(n1901), .B(n2591), .C(n2633), .D(n1900), .Y(n1905) );
  INVX3 U2292 ( .A(n2357), .Y(n1976) );
  NOR3X1 U2293 ( .A(STRING[25]), .B(STRING[30]), .C(STRING[28]), .Y(n1903) );
  NOR2X1 U2294 ( .A(STRING[26]), .B(STRING[31]), .Y(n1902) );
  NAND4X1 U2295 ( .A(n1903), .B(n2590), .C(n2631), .D(n1902), .Y(n1904) );
  NOR3XL U2296 ( .A(STRING[239]), .B(STRING[244]), .C(STRING[242]), .Y(n1909)
         );
  NOR4X1 U2297 ( .A(STRING[241]), .B(STRING[240]), .C(STRING[238]), .D(
        STRING[245]), .Y(n1908) );
  OAI2BB1X1 U2298 ( .A0N(n1909), .A1N(n1908), .B0(n2559), .Y(n1913) );
  NOR3XL U2299 ( .A(STRING[121]), .B(STRING[126]), .C(STRING[124]), .Y(n1911)
         );
  NOR4X1 U2300 ( .A(STRING[123]), .B(STRING[122]), .C(STRING[120]), .D(
        STRING[127]), .Y(n1910) );
  INVX3 U2301 ( .A(n1997), .Y(n1968) );
  OAI2BB1X1 U2302 ( .A0N(n1911), .A1N(n1910), .B0(n1968), .Y(n1912) );
  NAND4BX4 U2303 ( .AN(n1915), .B(n1914), .C(n1913), .D(n1912), .Y(n1916) );
  OAI22X1 U2304 ( .A0(n1997), .A1(n2638), .B0(n2357), .B1(n2734), .Y(n1921) );
  AOI21X1 U2305 ( .A0(n2311), .A1(STRING[171]), .B0(n2559), .Y(n1920) );
  AOI22X1 U2306 ( .A0(n2001), .A1(STRING[109]), .B0(STRING[203]), .B1(n1998), 
        .Y(n1919) );
  AOI22X1 U2307 ( .A0(n1999), .A1(STRING[227]), .B0(STRING[77]), .B1(n2000), 
        .Y(n1918) );
  INVX2 U2308 ( .A(n2559), .Y(n1922) );
  AOI22X1 U2309 ( .A0(n2311), .A1(STRING[156]), .B0(n1976), .B1(STRING[29]), 
        .Y(n1925) );
  AOI22X1 U2310 ( .A0(STRING[187]), .A1(n1998), .B0(n2000), .B1(STRING[61]), 
        .Y(n1924) );
  AOI22X1 U2311 ( .A0(STRING[215]), .A1(n1999), .B0(n2001), .B1(STRING[93]), 
        .Y(n1923) );
  NAND4BX2 U2312 ( .AN(n1926), .B(n1925), .C(n1924), .D(n1923), .Y(n1927) );
  NOR2X6 U2313 ( .A(n1930), .B(n1929), .Y(n2011) );
  NOR3XL U2314 ( .A(STRING[252]), .B(STRING[247]), .C(STRING[250]), .Y(n1932)
         );
  NOR4XL U2315 ( .A(STRING[253]), .B(STRING[248]), .C(STRING[246]), .D(
        STRING[249]), .Y(n1931) );
  OAI2BB1X2 U2316 ( .A0N(n1932), .A1N(n1931), .B0(n2559), .Y(n1943) );
  NOR3XL U2317 ( .A(STRING[129]), .B(STRING[134]), .C(STRING[132]), .Y(n1934)
         );
  NOR4XL U2318 ( .A(STRING[131]), .B(STRING[130]), .C(STRING[128]), .D(
        STRING[135]), .Y(n1933) );
  OAI2BB1X2 U2319 ( .A0N(n1934), .A1N(n1933), .B0(n1968), .Y(n1942) );
  NOR3XL U2320 ( .A(STRING[162]), .B(STRING[164]), .C(STRING[159]), .Y(n1936)
         );
  NOR4XL U2321 ( .A(STRING[165]), .B(STRING[160]), .C(STRING[158]), .D(
        STRING[161]), .Y(n1935) );
  OAI2BB1X2 U2322 ( .A0N(n1936), .A1N(n1935), .B0(n2311), .Y(n1941) );
  NOR3X1 U2323 ( .A(STRING[33]), .B(STRING[38]), .C(STRING[36]), .Y(n1938) );
  NOR2XL U2324 ( .A(STRING[34]), .B(STRING[39]), .Y(n1937) );
  NAND4X1 U2325 ( .A(n1938), .B(n2627), .C(n2717), .D(n1937), .Y(n1939) );
  NAND2X1 U2326 ( .A(n1976), .B(n1939), .Y(n1940) );
  NAND4X2 U2327 ( .A(n1943), .B(n1942), .C(n1941), .D(n1940), .Y(n1959) );
  NOR3XL U2328 ( .A(STRING[194]), .B(STRING[196]), .C(STRING[191]), .Y(n1945)
         );
  NOR4X1 U2329 ( .A(STRING[197]), .B(STRING[192]), .C(STRING[190]), .D(
        STRING[193]), .Y(n1944) );
  OAI2BB1X1 U2330 ( .A0N(n1945), .A1N(n1944), .B0(n1998), .Y(n1957) );
  NOR3XL U2331 ( .A(STRING[65]), .B(STRING[70]), .C(STRING[68]), .Y(n1947) );
  NOR4XL U2332 ( .A(STRING[67]), .B(STRING[66]), .C(STRING[64]), .D(STRING[71]), .Y(n1946) );
  OAI2BB1X2 U2333 ( .A0N(n1947), .A1N(n1946), .B0(n2000), .Y(n1956) );
  NOR3X1 U2334 ( .A(STRING[218]), .B(STRING[222]), .C(STRING[220]), .Y(n1949)
         );
  NOR2XL U2335 ( .A(STRING[219]), .B(STRING[223]), .Y(n1948) );
  NAND4X1 U2336 ( .A(n1949), .B(n2629), .C(n2720), .D(n1948), .Y(n1950) );
  NAND2X1 U2337 ( .A(n1999), .B(n1950), .Y(n1955) );
  NOR3X1 U2338 ( .A(STRING[97]), .B(STRING[102]), .C(STRING[100]), .Y(n1952)
         );
  NOR2XL U2339 ( .A(STRING[98]), .B(STRING[103]), .Y(n1951) );
  NAND4X1 U2340 ( .A(n1952), .B(n2709), .C(n2619), .D(n1951), .Y(n1953) );
  NAND2X1 U2341 ( .A(n2001), .B(n1953), .Y(n1954) );
  NAND4X2 U2342 ( .A(n1957), .B(n1956), .C(n1955), .D(n1954), .Y(n1958) );
  NOR2X2 U2343 ( .A(n1959), .B(n1958), .Y(n1965) );
  OAI22X1 U2344 ( .A0(n1997), .A1(n2639), .B0(n2357), .B1(n2735), .Y(n1963) );
  AOI22X1 U2345 ( .A0(STRING[251]), .A1(n2559), .B0(n2311), .B1(STRING[163]), 
        .Y(n1962) );
  AOI22X1 U2346 ( .A0(n1999), .A1(STRING[221]), .B0(STRING[195]), .B1(n1998), 
        .Y(n1961) );
  AOI22X1 U2347 ( .A0(n2001), .A1(STRING[101]), .B0(STRING[69]), .B1(n2000), 
        .Y(n1960) );
  NAND4BX2 U2348 ( .AN(n1963), .B(n1962), .C(n1961), .D(n1960), .Y(n1964) );
  NAND2X2 U2349 ( .A(n1965), .B(n1964), .Y(n2009) );
  NOR3XL U2350 ( .A(STRING[231]), .B(STRING[236]), .C(STRING[234]), .Y(n1967)
         );
  NOR4X1 U2351 ( .A(STRING[233]), .B(STRING[232]), .C(STRING[230]), .D(
        STRING[237]), .Y(n1966) );
  OAI2BB1X2 U2352 ( .A0N(n1967), .A1N(n1966), .B0(n2559), .Y(n1980) );
  NOR3XL U2353 ( .A(STRING[113]), .B(STRING[118]), .C(STRING[116]), .Y(n1970)
         );
  NOR4X1 U2354 ( .A(STRING[115]), .B(STRING[114]), .C(STRING[112]), .D(
        STRING[119]), .Y(n1969) );
  OAI2BB1X1 U2355 ( .A0N(n1970), .A1N(n1969), .B0(n1968), .Y(n1979) );
  NOR3XL U2356 ( .A(STRING[148]), .B(STRING[150]), .C(STRING[145]), .Y(n1972)
         );
  NOR4XL U2357 ( .A(STRING[151]), .B(STRING[146]), .C(STRING[144]), .D(
        STRING[147]), .Y(n1971) );
  OAI2BB1X1 U2358 ( .A0N(n1972), .A1N(n1971), .B0(n2311), .Y(n1978) );
  NOR3X1 U2359 ( .A(STRING[17]), .B(STRING[22]), .C(STRING[20]), .Y(n1974) );
  NOR2X1 U2360 ( .A(STRING[18]), .B(STRING[23]), .Y(n1973) );
  NAND4X1 U2361 ( .A(n1974), .B(n2713), .C(n2625), .D(n1973), .Y(n1975) );
  NAND2X1 U2362 ( .A(n1976), .B(n1975), .Y(n1977) );
  NAND4X2 U2363 ( .A(n1980), .B(n1979), .C(n1978), .D(n1977), .Y(n1996) );
  NOR3XL U2364 ( .A(STRING[178]), .B(STRING[180]), .C(STRING[175]), .Y(n1982)
         );
  NOR4X1 U2365 ( .A(STRING[181]), .B(STRING[176]), .C(STRING[174]), .D(
        STRING[177]), .Y(n1981) );
  OAI2BB1X1 U2366 ( .A0N(n1982), .A1N(n1981), .B0(n1998), .Y(n1994) );
  NOR3XL U2367 ( .A(STRING[49]), .B(STRING[54]), .C(STRING[52]), .Y(n1984) );
  NOR4X1 U2368 ( .A(STRING[51]), .B(STRING[50]), .C(STRING[48]), .D(STRING[55]), .Y(n1983) );
  OAI2BB1X2 U2369 ( .A0N(n1984), .A1N(n1983), .B0(n2000), .Y(n1993) );
  NOR3X1 U2370 ( .A(STRING[206]), .B(STRING[210]), .C(STRING[208]), .Y(n1986)
         );
  NOR2XL U2371 ( .A(STRING[207]), .B(STRING[211]), .Y(n1985) );
  NAND4X1 U2372 ( .A(n1986), .B(n2718), .C(n2628), .D(n1985), .Y(n1987) );
  NAND2X1 U2373 ( .A(n1999), .B(n1987), .Y(n1992) );
  NOR3X1 U2374 ( .A(STRING[81]), .B(STRING[86]), .C(STRING[84]), .Y(n1989) );
  NOR2XL U2375 ( .A(STRING[82]), .B(STRING[87]), .Y(n1988) );
  NAND4X1 U2376 ( .A(n1989), .B(n2616), .C(n2707), .D(n1988), .Y(n1990) );
  NAND2X1 U2377 ( .A(n2001), .B(n1990), .Y(n1991) );
  NAND4X2 U2378 ( .A(n1994), .B(n1993), .C(n1992), .D(n1991), .Y(n1995) );
  NOR2X2 U2379 ( .A(n1996), .B(n1995), .Y(n2007) );
  OAI22X1 U2380 ( .A0(n1997), .A1(n2730), .B0(n2357), .B1(n2635), .Y(n2005) );
  AOI22X1 U2381 ( .A0(STRING[235]), .A1(n2559), .B0(n2311), .B1(STRING[149]), 
        .Y(n2004) );
  AOI22X1 U2382 ( .A0(n1999), .A1(STRING[209]), .B0(STRING[179]), .B1(n1998), 
        .Y(n2003) );
  AOI22X1 U2383 ( .A0(n2001), .A1(STRING[85]), .B0(STRING[53]), .B1(n2000), 
        .Y(n2002) );
  NAND4BX2 U2384 ( .AN(n2005), .B(n2004), .C(n2003), .D(n2002), .Y(n2006) );
  NAND2X2 U2385 ( .A(n2007), .B(n2006), .Y(n2008) );
  MXI2X4 U2386 ( .A(n2009), .B(n2008), .S0(n2025), .Y(n2010) );
  MXI2X4 U2387 ( .A(n2011), .B(n2010), .S0(n1238), .Y(n2013) );
  NOR4X1 U2388 ( .A(STRING[12]), .B(STRING[14]), .C(STRING[15]), .D(n2649), 
        .Y(n2014) );
  NAND2X1 U2389 ( .A(n2015), .B(n2014), .Y(n2019) );
  NOR4X1 U2390 ( .A(STRING[2]), .B(STRING[0]), .C(STRING[3]), .D(STRING[1]), 
        .Y(n2017) );
  NOR4X1 U2391 ( .A(STRING[4]), .B(STRING[6]), .C(STRING[7]), .D(n2741), .Y(
        n2016) );
  NAND2X1 U2392 ( .A(n2017), .B(n2016), .Y(n2018) );
  NAND2X1 U2393 ( .A(n2020), .B(str_start_idx[5]), .Y(n2021) );
  NAND2X6 U2394 ( .A(n2022), .B(n2021), .Y(n2562) );
  NAND2X8 U2395 ( .A(n2562), .B(n2565), .Y(n2555) );
  INVX4 U2396 ( .A(n2562), .Y(n2023) );
  NAND2X4 U2397 ( .A(n2023), .B(n2565), .Y(n2537) );
  OA21X4 U2398 ( .A0(n2555), .A1(n2698), .B0(n2537), .Y(n2540) );
  OR2X1 U2399 ( .A(n2555), .B(n2696), .Y(n2024) );
  NAND2X4 U2400 ( .A(n2540), .B(n2024), .Y(n2547) );
  OR2X1 U2401 ( .A(n2025), .B(n1238), .Y(n2551) );
  NOR2X2 U2402 ( .A(n2555), .B(n2551), .Y(n2560) );
  MXI2X4 U2403 ( .A(n2547), .B(n2560), .S0(n2589), .Y(n2029) );
  NOR2X1 U2404 ( .A(star_exit_start_idx[0]), .B(star_exit_start_idx[1]), .Y(
        n2541) );
  NAND2X1 U2405 ( .A(n2541), .B(n2778), .Y(n2548) );
  NOR2X1 U2406 ( .A(n2548), .B(n2565), .Y(n2027) );
  NOR3XL U2407 ( .A(n2541), .B(n2565), .C(n2778), .Y(n2026) );
  NOR2X1 U2408 ( .A(n2027), .B(n2026), .Y(n2028) );
  NAND2X1 U2409 ( .A(n2586), .B(check_point_idx[0]), .Y(n2030) );
  NAND2X1 U2410 ( .A(n2586), .B(check_point_idx[3]), .Y(n2033) );
  BUFX2 U2411 ( .A(n2031), .Y(n2032) );
  OR2X1 U2412 ( .A(n2068), .B(n2697), .Y(n2034) );
  OAI22XL U2413 ( .A0(n2133), .A1(n2034), .B0(n2262), .B1(n2781), .Y(n1206) );
  NAND2X2 U2414 ( .A(n2513), .B(n2586), .Y(n2039) );
  OAI22XL U2415 ( .A0(n2039), .A1(n2796), .B0(n2513), .B1(n1228), .Y(n851) );
  BUFX2 U2416 ( .A(n2036), .Y(n2489) );
  OAI22XL U2417 ( .A0(n2039), .A1(n2793), .B0(n2489), .B1(n2513), .Y(n928) );
  OAI22XL U2418 ( .A0(n2039), .A1(n2795), .B0(n2037), .B1(n2513), .Y(n852) );
  OAI22XL U2419 ( .A0(n2039), .A1(n2794), .B0(n2038), .B1(n2513), .Y(n853) );
  OR2X2 U2420 ( .A(n2310), .B(n1229), .Y(n2043) );
  NAND2X2 U2421 ( .A(n2310), .B(n2586), .Y(n2536) );
  OAI22XL U2422 ( .A0(n2043), .A1(n2790), .B0(n2536), .B1(n2620), .Y(n848) );
  OAI22XL U2423 ( .A0(n2043), .A1(n2788), .B0(n2536), .B1(n2698), .Y(n845) );
  OAI22XL U2424 ( .A0(n2043), .A1(n2792), .B0(n2536), .B1(n2618), .Y(n849) );
  OAI21XL U2425 ( .A0(n2492), .A1(n2046), .B0(n2586), .Y(n2041) );
  NAND3X1 U2426 ( .A(ispattern), .B(n2586), .C(n2695), .Y(n2040) );
  OAI22XL U2427 ( .A0(n2695), .A1(n2041), .B0(n2492), .B1(n2040), .Y(n925) );
  NAND2X6 U2428 ( .A(str_count[2]), .B(n2068), .Y(n2244) );
  OAI21XL U2429 ( .A0(str_count[2]), .A1(n2068), .B0(isstring_reg), .Y(n2042)
         );
  OAI22XL U2430 ( .A0(n2198), .A1(n2042), .B0(n2262), .B1(n2786), .Y(n1204) );
  OAI22XL U2431 ( .A0(n2043), .A1(n2778), .B0(n2536), .B1(n2589), .Y(n847) );
  OAI22XL U2432 ( .A0(n2043), .A1(n2789), .B0(n2536), .B1(n2696), .Y(n846) );
  CLKBUFX3 U2433 ( .A(n2044), .Y(n2824) );
  CLKBUFX3 U2434 ( .A(n2044), .Y(n2822) );
  CLKBUFX3 U2435 ( .A(n2044), .Y(n2823) );
  CLKBUFX3 U2436 ( .A(n2044), .Y(n2826) );
  CLKBUFX3 U2437 ( .A(n2044), .Y(n2825) );
  CLKBUFX3 U2438 ( .A(n2044), .Y(n2830) );
  CLKBUFX3 U2439 ( .A(n2044), .Y(n2831) );
  CLKBUFX3 U2440 ( .A(n2044), .Y(n2832) );
  BUFX12 U2441 ( .A(n2833), .Y(match) );
  BUFX12 U2442 ( .A(n2837), .Y(match_index[1]) );
  BUFX12 U2443 ( .A(n2835), .Y(match_index[3]) );
  BUFX12 U2444 ( .A(n2839), .Y(valid) );
  BUFX12 U2445 ( .A(n2836), .Y(match_index[2]) );
  BUFX12 U2446 ( .A(n2834), .Y(match_index[4]) );
  BUFX12 U2447 ( .A(n2838), .Y(match_index[0]) );
  NOR2X1 U2448 ( .A(n2784), .B(n2046), .Y(n2051) );
  NOR2XL U2449 ( .A(pat_count[0]), .B(ispattern), .Y(n2045) );
  NOR3X1 U2450 ( .A(n1229), .B(n2051), .C(n2045), .Y(n926) );
  NOR2X2 U2451 ( .A(n2492), .B(n2270), .Y(n2047) );
  BUFX8 U2452 ( .A(n2047), .Y(n2254) );
  INVX6 U2453 ( .A(n2254), .Y(n2256) );
  NAND2XL U2454 ( .A(n1231), .B(ispattern), .Y(n2048) );
  OAI21X1 U2455 ( .A0(n2492), .A1(n2048), .B0(pat_count[3]), .Y(n2049) );
  NOR2XL U2456 ( .A(pat_count[1]), .B(n2051), .Y(n2050) );
  AOI211X1 U2457 ( .A0(pat_count[1]), .A1(n2051), .B0(n1229), .C0(n2050), .Y(
        n927) );
  NOR2X8 U2458 ( .A(n2244), .B(n2787), .Y(n2055) );
  NAND2X6 U2459 ( .A(n2053), .B(n2052), .Y(n2240) );
  NAND2X4 U2460 ( .A(n2055), .B(str_count[4]), .Y(n2054) );
  XOR2X4 U2461 ( .A(str_count[5]), .B(n2054), .Y(n2263) );
  NAND2X8 U2462 ( .A(isstring_reg), .B(n2263), .Y(n2097) );
  NAND2X1 U2463 ( .A(n2468), .B(STRING[202]), .Y(n2056) );
  OAI21X1 U2464 ( .A0(n2436), .A1(n2468), .B0(n2056), .Y(n1132) );
  NAND2X1 U2465 ( .A(n2468), .B(STRING[200]), .Y(n2057) );
  OAI21X1 U2466 ( .A0(n2408), .A1(n2468), .B0(n2057), .Y(n1130) );
  NAND2X1 U2467 ( .A(n2468), .B(STRING[199]), .Y(n2058) );
  OAI21X1 U2468 ( .A0(n2388), .A1(n2468), .B0(n2058), .Y(n1129) );
  NAND2X1 U2469 ( .A(n2468), .B(STRING[201]), .Y(n2059) );
  NAND2X1 U2470 ( .A(n2468), .B(STRING[205]), .Y(n2061) );
  OAI21X1 U2471 ( .A0(n2447), .A1(n2468), .B0(n2061), .Y(n1135) );
  NAND2X1 U2472 ( .A(n2468), .B(STRING[204]), .Y(n2062) );
  OAI21X1 U2473 ( .A0(n2415), .A1(n2468), .B0(n2062), .Y(n1134) );
  NOR3X2 U2474 ( .A(n2781), .B(str_count[0]), .C(str_count[2]), .Y(n2385) );
  NAND2X4 U2475 ( .A(n2241), .B(n2240), .Y(n2242) );
  NAND2X1 U2476 ( .A(n2165), .B(n2161), .Y(n2064) );
  NAND2X1 U2477 ( .A(n2165), .B(n2150), .Y(n2065) );
  OAI21X1 U2478 ( .A0(n2165), .A1(n2809), .B0(n2065), .Y(n1172) );
  OAI21X1 U2479 ( .A0(n2165), .A1(n2806), .B0(n2066), .Y(n1170) );
  NAND2X1 U2480 ( .A(n2165), .B(n2178), .Y(n2067) );
  OAI21X1 U2481 ( .A0(n2165), .A1(n2804), .B0(n2067), .Y(n1176) );
  CLKINVX1 U2482 ( .A(n2068), .Y(n2069) );
  NOR2BX4 U2483 ( .AN(n2367), .B(n2375), .Y(n2070) );
  NAND2X1 U2484 ( .A(n2070), .B(n2157), .Y(n2071) );
  OAI21X1 U2485 ( .A0(n2070), .A1(n2746), .B0(n2071), .Y(n1161) );
  NAND2X1 U2486 ( .A(n2173), .B(n2161), .Y(n2074) );
  OAI21X1 U2487 ( .A0(n2173), .A1(n2732), .B0(n2074), .Y(n1159) );
  NAND2X1 U2488 ( .A(n2070), .B(n2150), .Y(n2075) );
  OAI21X1 U2489 ( .A0(n2070), .A1(n2751), .B0(n2075), .Y(n1164) );
  NAND2X1 U2490 ( .A(n2173), .B(n2148), .Y(n2076) );
  OAI21X1 U2491 ( .A0(n2173), .A1(n2739), .B0(n2076), .Y(n1154) );
  NAND2X1 U2492 ( .A(n2173), .B(n2157), .Y(n2077) );
  OAI21X1 U2493 ( .A0(n2173), .A1(n2744), .B0(n2077), .Y(n1153) );
  NAND2X1 U2494 ( .A(n2070), .B(n2161), .Y(n2078) );
  OAI21X1 U2495 ( .A0(n2070), .A1(n2733), .B0(n2078), .Y(n1167) );
  NAND2X1 U2496 ( .A(n2173), .B(n2150), .Y(n2079) );
  OAI21X1 U2497 ( .A0(n2173), .A1(n2750), .B0(n2079), .Y(n1156) );
  NAND2X1 U2498 ( .A(n2173), .B(n2159), .Y(n2080) );
  OAI21X1 U2499 ( .A0(n2173), .A1(n2742), .B0(n2080), .Y(n1158) );
  NAND2X1 U2500 ( .A(n2070), .B(n2159), .Y(n2081) );
  OAI21X1 U2501 ( .A0(n2070), .A1(n2745), .B0(n2081), .Y(n1166) );
  NAND2X1 U2502 ( .A(n2070), .B(n2148), .Y(n2082) );
  OAI21X1 U2503 ( .A0(n2070), .A1(n2740), .B0(n2082), .Y(n1162) );
  NOR2BX2 U2504 ( .AN(n2383), .B(n2375), .Y(n2083) );
  NAND2X1 U2505 ( .A(n2177), .B(n2150), .Y(n2084) );
  OAI21X1 U2506 ( .A0(n2177), .A1(n2660), .B0(n2084), .Y(n1140) );
  NOR3X2 U2507 ( .A(n2779), .B(n2786), .C(str_count[1]), .Y(n2366) );
  NOR2BX2 U2508 ( .AN(n2366), .B(n2375), .Y(n2085) );
  NAND2X1 U2509 ( .A(n2180), .B(n2157), .Y(n2086) );
  OAI21X1 U2510 ( .A0(n2180), .A1(n2657), .B0(n2086), .Y(n1145) );
  NAND2X1 U2511 ( .A(n2177), .B(n2148), .Y(n2087) );
  OAI21X1 U2512 ( .A0(n2177), .A1(n2643), .B0(n2087), .Y(n1138) );
  NAND2X1 U2513 ( .A(n2177), .B(n2157), .Y(n2088) );
  OAI21X1 U2514 ( .A0(n2177), .A1(n2653), .B0(n2088), .Y(n1137) );
  NAND2X1 U2515 ( .A(n2180), .B(n2150), .Y(n2089) );
  OAI21X1 U2516 ( .A0(n2180), .A1(n2661), .B0(n2089), .Y(n1148) );
  NAND2X1 U2517 ( .A(n2180), .B(n2159), .Y(n2090) );
  OAI21X1 U2518 ( .A0(n2180), .A1(n2654), .B0(n2090), .Y(n1150) );
  NAND2X1 U2519 ( .A(n2177), .B(n2161), .Y(n2091) );
  NAND2X1 U2520 ( .A(n2177), .B(n2159), .Y(n2092) );
  NAND2X1 U2521 ( .A(n2180), .B(n2161), .Y(n2093) );
  NAND2X1 U2522 ( .A(n2180), .B(n2148), .Y(n2094) );
  OAI21X1 U2523 ( .A0(n2180), .A1(n2646), .B0(n2094), .Y(n1146) );
  NAND2X1 U2524 ( .A(n2180), .B(n2174), .Y(n2095) );
  OAI21X1 U2525 ( .A0(n2180), .A1(n1368), .B0(n2095), .Y(n1147) );
  NAND3BX4 U2526 ( .AN(n2097), .B(n2096), .C(n2240), .Y(n2386) );
  NAND2X1 U2527 ( .A(n2101), .B(STRING[142]), .Y(n2099) );
  NAND2X1 U2528 ( .A(n2101), .B(STRING[139]), .Y(n2100) );
  OAI21X1 U2529 ( .A0(n2101), .A1(n2399), .B0(n2100), .Y(n1067) );
  NAND2X1 U2530 ( .A(n2101), .B(STRING[137]), .Y(n2102) );
  OAI21X1 U2531 ( .A0(n2101), .A1(n2388), .B0(n2102), .Y(n1065) );
  NAND2X1 U2532 ( .A(n2101), .B(STRING[143]), .Y(n2103) );
  OAI21X1 U2533 ( .A0(n2101), .A1(n2447), .B0(n2103), .Y(n1071) );
  NAND2X1 U2534 ( .A(n2101), .B(STRING[138]), .Y(n2104) );
  OAI21X1 U2535 ( .A0(n2101), .A1(n2408), .B0(n2104), .Y(n1066) );
  NAND2X1 U2536 ( .A(n2101), .B(STRING[136]), .Y(n2105) );
  OAI21X1 U2537 ( .A0(n2101), .A1(n2425), .B0(n2105), .Y(n1072) );
  NAND2X1 U2538 ( .A(n1227), .B(STRING[100]), .Y(n2106) );
  OAI21X1 U2539 ( .A0(n1227), .A1(n2436), .B0(n2106), .Y(n1028) );
  NAND2X1 U2540 ( .A(n1227), .B(STRING[102]), .Y(n2107) );
  OAI21X1 U2541 ( .A0(n1227), .A1(n2415), .B0(n2107), .Y(n1030) );
  NAND2X1 U2542 ( .A(n1227), .B(STRING[103]), .Y(n2109) );
  NAND2X1 U2543 ( .A(n1227), .B(STRING[97]), .Y(n2110) );
  OAI21X1 U2544 ( .A0(n1227), .A1(n2388), .B0(n2110), .Y(n1025) );
  NAND2X1 U2545 ( .A(n2190), .B(STRING[108]), .Y(n2111) );
  OAI21X1 U2546 ( .A0(n2190), .A1(n2436), .B0(n2111), .Y(n1036) );
  NAND2X1 U2547 ( .A(n2190), .B(STRING[110]), .Y(n2112) );
  OAI21X1 U2548 ( .A0(n2190), .A1(n2415), .B0(n2112), .Y(n1038) );
  NAND2X1 U2549 ( .A(n2190), .B(STRING[105]), .Y(n2114) );
  OAI21X1 U2550 ( .A0(n2190), .A1(n2388), .B0(n2114), .Y(n1033) );
  NAND2X1 U2551 ( .A(n2190), .B(STRING[111]), .Y(n2115) );
  OAI21X1 U2552 ( .A0(n2190), .A1(n2447), .B0(n2115), .Y(n1039) );
  NAND2X1 U2553 ( .A(n2190), .B(STRING[106]), .Y(n2116) );
  OAI21X1 U2554 ( .A0(n2190), .A1(n2408), .B0(n2116), .Y(n1034) );
  NOR2X1 U2555 ( .A(pat_count[1]), .B(n1231), .Y(n2499) );
  NAND2X2 U2556 ( .A(n2499), .B(n2324), .Y(n2290) );
  NAND2X1 U2557 ( .A(chardata[3]), .B(n2117), .Y(n2118) );
  OAI21X1 U2558 ( .A0(n2117), .A1(n2714), .B0(n2118), .Y(n862) );
  NAND2X1 U2559 ( .A(chardata[5]), .B(n2117), .Y(n2119) );
  OAI21X1 U2560 ( .A0(n2117), .A1(n2715), .B0(n2119), .Y(n864) );
  NAND2X1 U2561 ( .A(n1226), .B(STRING[92]), .Y(n2120) );
  OAI21X1 U2562 ( .A0(n1226), .A1(n2436), .B0(n2120), .Y(n1020) );
  NAND2X1 U2563 ( .A(n1226), .B(STRING[94]), .Y(n2121) );
  OAI21X1 U2564 ( .A0(n1226), .A1(n2415), .B0(n2121), .Y(n1022) );
  NAND2X1 U2565 ( .A(n1226), .B(STRING[89]), .Y(n2123) );
  OAI21X1 U2566 ( .A0(n1226), .A1(n2388), .B0(n2123), .Y(n1017) );
  NAND2X1 U2567 ( .A(n1226), .B(STRING[95]), .Y(n2124) );
  OAI21X1 U2568 ( .A0(n1226), .A1(n2447), .B0(n2124), .Y(n1023) );
  NOR3X2 U2569 ( .A(n2779), .B(str_count[1]), .C(str_count[2]), .Y(n2373) );
  NAND2X1 U2570 ( .A(n2128), .B(STRING[124]), .Y(n2125) );
  OAI21X1 U2571 ( .A0(n2128), .A1(n2436), .B0(n2125), .Y(n1052) );
  NAND2X1 U2572 ( .A(n2128), .B(STRING[123]), .Y(n2126) );
  OAI21X1 U2573 ( .A0(n2128), .A1(n2399), .B0(n2126), .Y(n1051) );
  NAND2X1 U2574 ( .A(n2128), .B(STRING[126]), .Y(n2127) );
  OAI21X1 U2575 ( .A0(n2128), .A1(n2415), .B0(n2127), .Y(n1054) );
  NAND2X1 U2576 ( .A(n2128), .B(STRING[122]), .Y(n2129) );
  OAI21X1 U2577 ( .A0(n2128), .A1(n2388), .B0(n2130), .Y(n1049) );
  NAND2X1 U2578 ( .A(n2128), .B(STRING[127]), .Y(n2131) );
  OAI21X1 U2579 ( .A0(n2128), .A1(n2447), .B0(n2131), .Y(n1055) );
  NAND2X1 U2580 ( .A(n2128), .B(STRING[120]), .Y(n2132) );
  OAI21X1 U2581 ( .A0(n2128), .A1(n2425), .B0(n2132), .Y(n1056) );
  NAND2X1 U2582 ( .A(n2196), .B(STRING[132]), .Y(n2134) );
  OAI21X1 U2583 ( .A0(n2196), .A1(n2436), .B0(n2134), .Y(n1060) );
  NAND2X1 U2584 ( .A(n2196), .B(STRING[131]), .Y(n2135) );
  OAI21X1 U2585 ( .A0(n2196), .A1(n2399), .B0(n2135), .Y(n1059) );
  NAND2X1 U2586 ( .A(n2196), .B(STRING[134]), .Y(n2136) );
  OAI21X1 U2587 ( .A0(n2196), .A1(n2415), .B0(n2136), .Y(n1062) );
  NAND2X1 U2588 ( .A(n2196), .B(STRING[135]), .Y(n2138) );
  OAI21X1 U2589 ( .A0(n2196), .A1(n2447), .B0(n2138), .Y(n1063) );
  NAND2X1 U2590 ( .A(n2196), .B(STRING[130]), .Y(n2139) );
  OAI21X1 U2591 ( .A0(n2196), .A1(n2408), .B0(n2139), .Y(n1058) );
  NAND2X1 U2592 ( .A(n2196), .B(STRING[128]), .Y(n2140) );
  OAI21X1 U2593 ( .A0(n2196), .A1(n2425), .B0(n2140), .Y(n1064) );
  NAND2X1 U2594 ( .A(n2196), .B(STRING[129]), .Y(n2141) );
  OAI21X1 U2595 ( .A0(n2196), .A1(n2388), .B0(n2141), .Y(n1057) );
  NAND2X1 U2596 ( .A(n1227), .B(STRING[98]), .Y(n2142) );
  OAI21X1 U2597 ( .A0(n1227), .A1(n2408), .B0(n2142), .Y(n1026) );
  NAND2X1 U2598 ( .A(n1226), .B(STRING[90]), .Y(n2143) );
  OAI21X1 U2599 ( .A0(n1226), .A1(n2408), .B0(n2143), .Y(n1018) );
  NAND2X1 U2600 ( .A(n2070), .B(n2470), .Y(n2145) );
  OAI21X1 U2601 ( .A0(n2070), .A1(n2798), .B0(n2145), .Y(n1165) );
  NAND2X1 U2602 ( .A(n2177), .B(n2470), .Y(n2146) );
  NAND2X1 U2603 ( .A(n2168), .B(n2148), .Y(n2149) );
  OAI21X1 U2604 ( .A0(n2168), .A1(n2807), .B0(n2149), .Y(n1178) );
  NAND2X1 U2605 ( .A(n2168), .B(n2159), .Y(n2152) );
  OAI21X1 U2606 ( .A0(n2168), .A1(n2811), .B0(n2152), .Y(n1182) );
  OAI21X1 U2607 ( .A0(n2168), .A1(n2805), .B0(n2153), .Y(n1184) );
  NAND2X1 U2608 ( .A(n2165), .B(n2174), .Y(n2154) );
  OAI21X1 U2609 ( .A0(n2165), .A1(n2801), .B0(n2154), .Y(n1171) );
  NAND2X1 U2610 ( .A(n2165), .B(n2157), .Y(n2155) );
  OAI21X1 U2611 ( .A0(n2165), .A1(n2810), .B0(n2155), .Y(n1169) );
  NAND2X1 U2612 ( .A(n2168), .B(n2174), .Y(n2156) );
  OAI21X1 U2613 ( .A0(n2168), .A1(n2802), .B0(n2156), .Y(n1179) );
  NAND2X1 U2614 ( .A(n2168), .B(n2157), .Y(n2158) );
  OAI21X1 U2615 ( .A0(n2168), .A1(n2813), .B0(n2158), .Y(n1177) );
  NAND2X1 U2616 ( .A(n2165), .B(n2159), .Y(n2160) );
  OAI21X1 U2617 ( .A0(n2165), .A1(n2808), .B0(n2160), .Y(n1174) );
  NAND2X1 U2618 ( .A(n2168), .B(n2161), .Y(n2162) );
  OAI21X1 U2619 ( .A0(n2168), .A1(n2700), .B0(n2162), .Y(n1183) );
  NAND2X1 U2620 ( .A(n2173), .B(n2470), .Y(n2163) );
  OAI21X1 U2621 ( .A0(n2173), .A1(n2800), .B0(n2163), .Y(n1157) );
  NAND2X1 U2622 ( .A(n2165), .B(n2470), .Y(n2164) );
  NAND2X1 U2623 ( .A(n2180), .B(n2470), .Y(n2166) );
  OAI21X1 U2624 ( .A0(n2180), .A1(n2754), .B0(n2166), .Y(n1149) );
  NAND2X1 U2625 ( .A(n2168), .B(n2470), .Y(n2167) );
  OAI21X1 U2626 ( .A0(n2168), .A1(n2731), .B0(n2167), .Y(n1181) );
  NAND2X1 U2627 ( .A(n2173), .B(n2178), .Y(n2169) );
  OAI21X1 U2628 ( .A0(n2173), .A1(n2720), .B0(n2169), .Y(n1160) );
  NAND2X1 U2629 ( .A(n2070), .B(n2178), .Y(n2170) );
  OAI21X1 U2630 ( .A0(n2070), .A1(n2632), .B0(n2170), .Y(n1168) );
  NAND2X1 U2631 ( .A(n2070), .B(n2174), .Y(n2171) );
  OAI21X1 U2632 ( .A0(n2070), .A1(n2724), .B0(n2171), .Y(n1163) );
  NAND2X1 U2633 ( .A(n2173), .B(n2174), .Y(n2172) );
  OAI21X1 U2634 ( .A0(n2173), .A1(n2629), .B0(n2172), .Y(n1155) );
  NAND2X1 U2635 ( .A(n2177), .B(n2174), .Y(n2175) );
  OAI21X1 U2636 ( .A0(n2177), .A1(n2718), .B0(n2175), .Y(n1139) );
  NAND2X1 U2637 ( .A(n2177), .B(n2178), .Y(n2176) );
  OAI21X1 U2638 ( .A0(n2177), .A1(n2628), .B0(n2176), .Y(n1144) );
  NAND2X1 U2639 ( .A(n2180), .B(n2178), .Y(n2179) );
  NAND2X1 U2640 ( .A(n1227), .B(STRING[99]), .Y(n2181) );
  OAI21X1 U2641 ( .A0(n1227), .A1(n2399), .B0(n2181), .Y(n1027) );
  NAND2X1 U2642 ( .A(n1227), .B(STRING[96]), .Y(n2182) );
  OAI21X1 U2643 ( .A0(n1227), .A1(n2425), .B0(n2182), .Y(n1032) );
  NAND2X1 U2644 ( .A(n2190), .B(STRING[107]), .Y(n2183) );
  OAI21X1 U2645 ( .A0(n2190), .A1(n2399), .B0(n2183), .Y(n1035) );
  NAND2X1 U2646 ( .A(n2190), .B(STRING[104]), .Y(n2184) );
  OAI21X1 U2647 ( .A0(n2190), .A1(n2425), .B0(n2184), .Y(n1040) );
  NAND2X1 U2648 ( .A(n1226), .B(STRING[91]), .Y(n2185) );
  OAI21X1 U2649 ( .A0(n1226), .A1(n2399), .B0(n2185), .Y(n1019) );
  NAND2X1 U2650 ( .A(n1226), .B(STRING[88]), .Y(n2186) );
  NAND2X1 U2651 ( .A(n2101), .B(STRING[141]), .Y(n2187) );
  OAI21X1 U2652 ( .A0(n2478), .A1(n2101), .B0(n2187), .Y(n1069) );
  NAND2X1 U2653 ( .A(n1227), .B(STRING[101]), .Y(n2188) );
  OAI21X1 U2654 ( .A0(n2478), .A1(n1227), .B0(n2188), .Y(n1029) );
  NAND2X1 U2655 ( .A(n2190), .B(STRING[109]), .Y(n2189) );
  OAI21X1 U2656 ( .A0(n2478), .A1(n2190), .B0(n2189), .Y(n1037) );
  NAND2X1 U2657 ( .A(n1226), .B(STRING[93]), .Y(n2191) );
  OAI21X1 U2658 ( .A0(n2478), .A1(n1226), .B0(n2191), .Y(n1021) );
  NAND2X1 U2659 ( .A(n2128), .B(STRING[125]), .Y(n2192) );
  OAI21X1 U2660 ( .A0(n2478), .A1(n2128), .B0(n2192), .Y(n1053) );
  NAND2X1 U2661 ( .A(chardata[1]), .B(n2117), .Y(n2193) );
  OAI21X1 U2662 ( .A0(n2117), .A1(n2719), .B0(n2193), .Y(n860) );
  NAND2X1 U2663 ( .A(chardata[6]), .B(n2117), .Y(n2194) );
  OAI21X1 U2664 ( .A0(n2117), .A1(n2716), .B0(n2194), .Y(n865) );
  NAND2X1 U2665 ( .A(n2196), .B(STRING[133]), .Y(n2195) );
  OAI21X1 U2666 ( .A0(n2478), .A1(n2196), .B0(n2195), .Y(n1061) );
  NAND2X1 U2667 ( .A(n1377), .B(STRING[76]), .Y(n2199) );
  OAI21X1 U2668 ( .A0(n1377), .A1(n2436), .B0(n2199), .Y(n1004) );
  NAND2X1 U2669 ( .A(n1377), .B(STRING[72]), .Y(n2200) );
  OAI21X1 U2670 ( .A0(n1377), .A1(n2425), .B0(n2200), .Y(n1008) );
  NAND2X1 U2671 ( .A(n1377), .B(STRING[74]), .Y(n2201) );
  OAI21X1 U2672 ( .A0(n1377), .A1(n2408), .B0(n2201), .Y(n1002) );
  NAND2X1 U2673 ( .A(n1377), .B(STRING[79]), .Y(n2202) );
  OAI21X1 U2674 ( .A0(n1377), .A1(n2447), .B0(n2202), .Y(n1007) );
  NAND2X1 U2675 ( .A(n1377), .B(STRING[78]), .Y(n2203) );
  OAI21X1 U2676 ( .A0(n1377), .A1(n2415), .B0(n2203), .Y(n1006) );
  NAND2X1 U2677 ( .A(n1218), .B(STRING[36]), .Y(n2204) );
  OAI21X1 U2678 ( .A0(n1218), .A1(n2436), .B0(n2204), .Y(n964) );
  NAND2X1 U2679 ( .A(n1218), .B(STRING[38]), .Y(n2205) );
  OAI21X1 U2680 ( .A0(n1218), .A1(n2415), .B0(n2205), .Y(n966) );
  NAND2X1 U2681 ( .A(n1217), .B(STRING[44]), .Y(n2206) );
  OAI21X1 U2682 ( .A0(n1217), .A1(n2436), .B0(n2206), .Y(n972) );
  NAND2X1 U2683 ( .A(n1217), .B(STRING[41]), .Y(n2207) );
  OAI21X1 U2684 ( .A0(n1217), .A1(n2388), .B0(n2207), .Y(n969) );
  NAND2X1 U2685 ( .A(n1217), .B(STRING[46]), .Y(n2208) );
  NAND2X1 U2686 ( .A(n1217), .B(STRING[42]), .Y(n2209) );
  NAND2X1 U2687 ( .A(n1217), .B(STRING[40]), .Y(n2210) );
  OAI21X1 U2688 ( .A0(n1217), .A1(n2425), .B0(n2210), .Y(n976) );
  NAND2X1 U2689 ( .A(n1217), .B(STRING[43]), .Y(n2211) );
  OAI21X1 U2690 ( .A0(n1217), .A1(n2399), .B0(n2211), .Y(n971) );
  NAND2X1 U2691 ( .A(n1370), .B(STRING[52]), .Y(n2212) );
  OAI21X1 U2692 ( .A0(n1370), .A1(n2436), .B0(n2212), .Y(n980) );
  NAND2X1 U2693 ( .A(n1219), .B(STRING[20]), .Y(n2213) );
  OAI21X1 U2694 ( .A0(n1219), .A1(n2436), .B0(n2213), .Y(n948) );
  NAND2X1 U2695 ( .A(n1370), .B(STRING[48]), .Y(n2214) );
  OAI21X1 U2696 ( .A0(n1370), .A1(n2425), .B0(n2214), .Y(n984) );
  NAND2X1 U2697 ( .A(n1370), .B(STRING[50]), .Y(n2215) );
  OAI21X1 U2698 ( .A0(n1370), .A1(n2408), .B0(n2215), .Y(n978) );
  NAND2X1 U2699 ( .A(n1370), .B(STRING[51]), .Y(n2216) );
  OAI21X1 U2700 ( .A0(n1370), .A1(n2399), .B0(n2216), .Y(n979) );
  NAND2X1 U2701 ( .A(n1370), .B(STRING[54]), .Y(n2217) );
  OAI21X1 U2702 ( .A0(n1370), .A1(n2415), .B0(n2217), .Y(n982) );
  NAND2X1 U2703 ( .A(n1370), .B(STRING[49]), .Y(n2218) );
  OAI21X1 U2704 ( .A0(n1370), .A1(n2388), .B0(n2218), .Y(n977) );
  NAND2X1 U2705 ( .A(n1370), .B(STRING[55]), .Y(n2219) );
  OAI21X1 U2706 ( .A0(n1370), .A1(n2447), .B0(n2219), .Y(n983) );
  NAND2X1 U2707 ( .A(n1219), .B(STRING[22]), .Y(n2220) );
  OAI21X1 U2708 ( .A0(n1219), .A1(n2415), .B0(n2220), .Y(n950) );
  NAND2X1 U2709 ( .A(n1216), .B(STRING[28]), .Y(n2221) );
  OAI21X1 U2710 ( .A0(n1216), .A1(n2436), .B0(n2221), .Y(n956) );
  NAND2X1 U2711 ( .A(n1216), .B(STRING[30]), .Y(n2222) );
  OAI21X1 U2712 ( .A0(n1216), .A1(n2415), .B0(n2222), .Y(n958) );
  NAND2X1 U2713 ( .A(n1216), .B(STRING[26]), .Y(n2223) );
  OAI21X1 U2714 ( .A0(n1216), .A1(n2408), .B0(n2223), .Y(n954) );
  NAND2X1 U2715 ( .A(n1216), .B(STRING[31]), .Y(n2224) );
  OAI21X1 U2716 ( .A0(n1216), .A1(n2447), .B0(n2224), .Y(n959) );
  NAND2X1 U2717 ( .A(n1215), .B(STRING[60]), .Y(n2225) );
  OAI21X1 U2718 ( .A0(n1215), .A1(n2436), .B0(n2225), .Y(n988) );
  NAND2X1 U2719 ( .A(n1215), .B(STRING[59]), .Y(n2226) );
  OAI21X1 U2720 ( .A0(n1215), .A1(n2399), .B0(n2226), .Y(n987) );
  NAND2X1 U2721 ( .A(n1215), .B(STRING[58]), .Y(n2227) );
  OAI21X1 U2722 ( .A0(n1215), .A1(n2408), .B0(n2227), .Y(n986) );
  NAND2X1 U2723 ( .A(n1215), .B(STRING[62]), .Y(n2228) );
  OAI21X1 U2724 ( .A0(n1215), .A1(n2415), .B0(n2228), .Y(n990) );
  NAND2X1 U2725 ( .A(n1215), .B(STRING[63]), .Y(n2229) );
  OAI21X1 U2726 ( .A0(n1215), .A1(n2447), .B0(n2229), .Y(n991) );
  NAND2X1 U2727 ( .A(n1215), .B(STRING[57]), .Y(n2230) );
  OAI21X1 U2728 ( .A0(n1215), .A1(n2388), .B0(n2230), .Y(n985) );
  NAND2X1 U2729 ( .A(n1215), .B(STRING[56]), .Y(n2231) );
  OAI21X1 U2730 ( .A0(n1215), .A1(n2425), .B0(n2231), .Y(n992) );
  NAND2X1 U2731 ( .A(n1369), .B(STRING[68]), .Y(n2233) );
  OAI21X1 U2732 ( .A0(n1369), .A1(n2436), .B0(n2233), .Y(n996) );
  OAI21X1 U2733 ( .A0(n1369), .A1(n2408), .B0(n2234), .Y(n994) );
  NAND2X1 U2734 ( .A(n1369), .B(STRING[71]), .Y(n2235) );
  OAI21X1 U2735 ( .A0(n1369), .A1(n2447), .B0(n2235), .Y(n999) );
  NAND2X1 U2736 ( .A(n1369), .B(STRING[64]), .Y(n2236) );
  OAI21X1 U2737 ( .A0(n1369), .A1(n2425), .B0(n2236), .Y(n1000) );
  NAND2X1 U2738 ( .A(n1369), .B(STRING[65]), .Y(n2237) );
  OAI21X1 U2739 ( .A0(n1369), .A1(n2388), .B0(n2237), .Y(n993) );
  NAND2X1 U2740 ( .A(n1369), .B(STRING[70]), .Y(n2238) );
  OAI21X1 U2741 ( .A0(n1369), .A1(n2415), .B0(n2238), .Y(n998) );
  NAND2X1 U2742 ( .A(n1369), .B(STRING[67]), .Y(n2239) );
  OAI21X1 U2743 ( .A0(n1369), .A1(n2399), .B0(n2239), .Y(n995) );
  OAI22XL U2744 ( .A0(n2240), .A1(n2697), .B0(n2262), .B1(n2787), .Y(n1203) );
  OAI22XL U2745 ( .A0(n2241), .A1(n2697), .B0(n2262), .B1(n2791), .Y(n1202) );
  NOR2X1 U2746 ( .A(n2376), .B(n2697), .Y(n2243) );
  MXI2X1 U2747 ( .A(n2399), .B(n2668), .S0(n2276), .Y(n931) );
  MXI2X1 U2748 ( .A(n2425), .B(n2602), .S0(n2276), .Y(n936) );
  MXI2X1 U2749 ( .A(n2415), .B(n2776), .S0(n2276), .Y(n934) );
  MXI2X1 U2750 ( .A(n2408), .B(n2690), .S0(n2276), .Y(n930) );
  MXI2X1 U2751 ( .A(n2436), .B(n2692), .S0(n2276), .Y(n932) );
  MXI2X1 U2752 ( .A(n2388), .B(n2777), .S0(n2276), .Y(n929) );
  MXI2X1 U2753 ( .A(n2447), .B(n2688), .S0(n2276), .Y(n935) );
  NOR2X1 U2754 ( .A(n2244), .B(n2697), .Y(n2245) );
  MXI2X1 U2755 ( .A(n2425), .B(n2674), .S0(n2279), .Y(n944) );
  MXI2X1 U2756 ( .A(n2399), .B(n2756), .S0(n2279), .Y(n939) );
  MXI2X1 U2757 ( .A(n2447), .B(n2606), .S0(n2279), .Y(n943) );
  MXI2X1 U2758 ( .A(n2415), .B(n2689), .S0(n2279), .Y(n942) );
  MXI2X1 U2759 ( .A(n2436), .B(n2608), .S0(n2279), .Y(n940) );
  MXI2X1 U2760 ( .A(n2408), .B(n2607), .S0(n2279), .Y(n938) );
  MXI2X1 U2761 ( .A(n2388), .B(n2691), .S0(n2279), .Y(n937) );
  NAND2X1 U2762 ( .A(chardata[3]), .B(n2254), .Y(n2247) );
  OAI2BB1X1 U2763 ( .A0N(PATTERN[3]), .A1N(n2256), .B0(n2247), .Y(n918) );
  NAND2X1 U2764 ( .A(chardata[5]), .B(n2254), .Y(n2248) );
  OAI2BB1X1 U2765 ( .A0N(PATTERN[5]), .A1N(n2256), .B0(n2248), .Y(n920) );
  NAND2X1 U2766 ( .A(chardata[7]), .B(n2254), .Y(n2249) );
  OAI2BB1X1 U2767 ( .A0N(PATTERN[7]), .A1N(n2256), .B0(n2249), .Y(n922) );
  NAND2X1 U2768 ( .A(chardata[2]), .B(n2254), .Y(n2250) );
  OAI2BB1X1 U2769 ( .A0N(PATTERN[2]), .A1N(n2256), .B0(n2250), .Y(n917) );
  NAND2X1 U2770 ( .A(chardata[0]), .B(n2254), .Y(n2251) );
  OAI2BB1X1 U2771 ( .A0N(PATTERN[0]), .A1N(n2256), .B0(n2251), .Y(n923) );
  NAND2X1 U2772 ( .A(chardata[6]), .B(n2254), .Y(n2252) );
  OAI2BB1X1 U2773 ( .A0N(PATTERN[6]), .A1N(n2256), .B0(n2252), .Y(n921) );
  NAND2X1 U2774 ( .A(chardata[4]), .B(n2254), .Y(n2253) );
  OAI2BB1X1 U2775 ( .A0N(PATTERN[4]), .A1N(n2256), .B0(n2253), .Y(n919) );
  NAND2X1 U2776 ( .A(chardata[1]), .B(n2254), .Y(n2255) );
  OAI2BB1X1 U2777 ( .A0N(PATTERN[1]), .A1N(n2256), .B0(n2255), .Y(n916) );
  OR2X4 U2778 ( .A(pat_count[0]), .B(n2270), .Y(n2264) );
  NOR2X4 U2779 ( .A(n2264), .B(pat_count[1]), .Y(n2257) );
  BUFX8 U2780 ( .A(n2257), .Y(n2287) );
  INVX6 U2781 ( .A(n2287), .Y(n2289) );
  NAND2X1 U2782 ( .A(chardata[7]), .B(n2287), .Y(n2258) );
  OAI2BB1X1 U2783 ( .A0N(PATTERN[31]), .A1N(n2289), .B0(n2258), .Y(n898) );
  NAND2X1 U2784 ( .A(chardata[4]), .B(n2287), .Y(n2259) );
  OAI2BB1X1 U2785 ( .A0N(PATTERN[28]), .A1N(n2289), .B0(n2259), .Y(n895) );
  NAND2X1 U2786 ( .A(chardata[0]), .B(n2287), .Y(n2260) );
  OAI2BB1X1 U2787 ( .A0N(PATTERN[24]), .A1N(n2289), .B0(n2260), .Y(n899) );
  NAND2X1 U2788 ( .A(chardata[2]), .B(n2287), .Y(n2261) );
  OAI2BB1X1 U2789 ( .A0N(PATTERN[26]), .A1N(n2289), .B0(n2261), .Y(n893) );
  OAI22XL U2790 ( .A0(n2263), .A1(n2697), .B0(n2262), .B1(n2797), .Y(n1201) );
  NOR2X6 U2791 ( .A(n2264), .B(n2693), .Y(n2296) );
  INVX6 U2792 ( .A(n2296), .Y(n2298) );
  NAND2X1 U2793 ( .A(chardata[4]), .B(n2296), .Y(n2265) );
  OAI2BB1X1 U2794 ( .A0N(PATTERN[12]), .A1N(n2298), .B0(n2265), .Y(n911) );
  OAI2BB1X1 U2795 ( .A0N(PATTERN[10]), .A1N(n2298), .B0(n2266), .Y(n909) );
  NAND2X1 U2796 ( .A(chardata[5]), .B(n2296), .Y(n2267) );
  OAI2BB1X1 U2797 ( .A0N(PATTERN[13]), .A1N(n2298), .B0(n2267), .Y(n912) );
  NAND2X1 U2798 ( .A(chardata[6]), .B(n2296), .Y(n2268) );
  OAI2BB1X1 U2799 ( .A0N(PATTERN[14]), .A1N(n2298), .B0(n2268), .Y(n913) );
  NAND2X1 U2800 ( .A(chardata[1]), .B(n2296), .Y(n2269) );
  OAI2BB1X1 U2801 ( .A0N(PATTERN[9]), .A1N(n2298), .B0(n2269), .Y(n908) );
  NAND2X1 U2802 ( .A(chardata[4]), .B(n2352), .Y(n2273) );
  OAI2BB1X1 U2803 ( .A0N(PATTERN[20]), .A1N(n2354), .B0(n2273), .Y(n903) );
  NAND2X1 U2804 ( .A(n2470), .B(n2274), .Y(n2275) );
  OAI2BB1X1 U2805 ( .A0N(STRING[5]), .A1N(n2276), .B0(n2275), .Y(n933) );
  NAND2X1 U2806 ( .A(n2470), .B(n2277), .Y(n2278) );
  OAI2BB1X1 U2807 ( .A0N(STRING[13]), .A1N(n2279), .B0(n2278), .Y(n941) );
  NAND2X1 U2808 ( .A(chardata[1]), .B(n2352), .Y(n2280) );
  OAI2BB1X1 U2809 ( .A0N(PATTERN[17]), .A1N(n2354), .B0(n2280), .Y(n900) );
  NAND2X1 U2810 ( .A(chardata[7]), .B(n2352), .Y(n2281) );
  OAI2BB1X1 U2811 ( .A0N(PATTERN[23]), .A1N(n2354), .B0(n2281), .Y(n906) );
  NAND2X1 U2812 ( .A(chardata[2]), .B(n2352), .Y(n2282) );
  OAI2BB1X1 U2813 ( .A0N(PATTERN[18]), .A1N(n2354), .B0(n2282), .Y(n901) );
  NAND2X1 U2814 ( .A(chardata[6]), .B(n2352), .Y(n2283) );
  OAI2BB1X1 U2815 ( .A0N(PATTERN[22]), .A1N(n2354), .B0(n2283), .Y(n905) );
  NAND2X1 U2816 ( .A(chardata[3]), .B(n2287), .Y(n2284) );
  OAI2BB1X1 U2817 ( .A0N(PATTERN[27]), .A1N(n2289), .B0(n2284), .Y(n894) );
  NAND2X1 U2818 ( .A(chardata[5]), .B(n2287), .Y(n2285) );
  OAI2BB1X1 U2819 ( .A0N(PATTERN[29]), .A1N(n2289), .B0(n2285), .Y(n896) );
  NAND2X1 U2820 ( .A(chardata[6]), .B(n2287), .Y(n2286) );
  OAI2BB1X1 U2821 ( .A0N(PATTERN[30]), .A1N(n2289), .B0(n2286), .Y(n897) );
  NAND2X1 U2822 ( .A(chardata[1]), .B(n2287), .Y(n2288) );
  OAI2BB1X1 U2823 ( .A0N(PATTERN[25]), .A1N(n2289), .B0(n2288), .Y(n892) );
  NAND2X1 U2824 ( .A(chardata[0]), .B(n2349), .Y(n2291) );
  OAI2BB1X1 U2825 ( .A0N(PATTERN[48]), .A1N(n2351), .B0(n2291), .Y(n875) );
  OAI2BB1X1 U2826 ( .A0N(PATTERN[54]), .A1N(n2351), .B0(n2292), .Y(n873) );
  NAND2X1 U2827 ( .A(chardata[4]), .B(n2349), .Y(n2293) );
  OAI2BB1X1 U2828 ( .A0N(PATTERN[52]), .A1N(n2351), .B0(n2293), .Y(n871) );
  NAND2X1 U2829 ( .A(chardata[0]), .B(n2296), .Y(n2294) );
  NAND2X1 U2830 ( .A(chardata[7]), .B(n2296), .Y(n2295) );
  NAND2X1 U2831 ( .A(chardata[3]), .B(n2296), .Y(n2297) );
  NAND2X1 U2832 ( .A(chardata[0]), .B(n2117), .Y(n2299) );
  OAI2BB1X1 U2833 ( .A0N(PATTERN[56]), .A1N(n2303), .B0(n2299), .Y(n867) );
  NAND2X1 U2834 ( .A(chardata[2]), .B(n2117), .Y(n2300) );
  OAI2BB1X1 U2835 ( .A0N(PATTERN[57]), .A1N(n2303), .B0(n2300), .Y(n861) );
  NAND2X1 U2836 ( .A(chardata[4]), .B(n2117), .Y(n2301) );
  OAI2BB1X1 U2837 ( .A0N(PATTERN[58]), .A1N(n2303), .B0(n2301), .Y(n863) );
  NAND2X1 U2838 ( .A(chardata[7]), .B(n2117), .Y(n2302) );
  OAI2BB1X1 U2839 ( .A0N(PATTERN[59]), .A1N(n2303), .B0(n2302), .Y(n866) );
  BUFX4 U2840 ( .A(n2304), .Y(n2306) );
  NAND2X4 U2841 ( .A(n2306), .B(n2305), .Y(n2309) );
  AND2X2 U2842 ( .A(n2515), .B(n2310), .Y(N617) );
  NOR2X1 U2843 ( .A(n1229), .B(n2618), .Y(n2313) );
  NAND2X4 U2844 ( .A(n2316), .B(n2315), .Y(n854) );
  MXI2X4 U2845 ( .A(n2361), .B(n1308), .S0(n2698), .Y(n858) );
  OAI2BB1X2 U2846 ( .A0N(PATTERN[35]), .A1N(n2344), .B0(n2319), .Y(n886) );
  NAND2XL U2847 ( .A(n2785), .B(state[0]), .Y(n2322) );
  OAI21XL U2848 ( .A0(ispattern), .A1(n2322), .B0(n2321), .Y(next_state[1]) );
  NAND2X1 U2849 ( .A(chardata[0]), .B(n2346), .Y(n2325) );
  OAI2BB1X1 U2850 ( .A0N(PATTERN[40]), .A1N(n2348), .B0(n2325), .Y(n883) );
  NAND2X1 U2851 ( .A(chardata[0]), .B(n2352), .Y(n2327) );
  OAI2BB1X4 U2852 ( .A0N(PATTERN[16]), .A1N(n2354), .B0(n2327), .Y(n907) );
  NAND2X1 U2853 ( .A(chardata[2]), .B(n2346), .Y(n2328) );
  OAI2BB1X1 U2854 ( .A0N(PATTERN[42]), .A1N(n2348), .B0(n2328), .Y(n877) );
  NAND2X1 U2855 ( .A(chardata[2]), .B(n2349), .Y(n2330) );
  NAND2X1 U2856 ( .A(chardata[7]), .B(n2346), .Y(n2331) );
  OAI2BB1X1 U2857 ( .A0N(PATTERN[47]), .A1N(n2348), .B0(n2331), .Y(n882) );
  NAND2X1 U2858 ( .A(chardata[7]), .B(n2349), .Y(n2333) );
  NAND2X1 U2859 ( .A(chardata[3]), .B(n2346), .Y(n2334) );
  OAI2BB1X1 U2860 ( .A0N(PATTERN[43]), .A1N(n2348), .B0(n2334), .Y(n878) );
  NAND2X1 U2861 ( .A(chardata[3]), .B(n2349), .Y(n2335) );
  NAND2X1 U2862 ( .A(chardata[3]), .B(n2352), .Y(n2336) );
  OAI2BB1X4 U2863 ( .A0N(PATTERN[19]), .A1N(n2354), .B0(n2336), .Y(n902) );
  NAND2X1 U2864 ( .A(chardata[6]), .B(n2346), .Y(n2337) );
  OAI2BB1X1 U2865 ( .A0N(PATTERN[46]), .A1N(n2348), .B0(n2337), .Y(n881) );
  OAI2BB1X1 U2866 ( .A0N(PATTERN[44]), .A1N(n2348), .B0(n2339), .Y(n879) );
  NAND2X1 U2867 ( .A(chardata[1]), .B(n2346), .Y(n2341) );
  OAI2BB1X1 U2868 ( .A0N(PATTERN[41]), .A1N(n2348), .B0(n2341), .Y(n876) );
  OAI2BB1X2 U2869 ( .A0N(PATTERN[33]), .A1N(n2344), .B0(n2343), .Y(n884) );
  NAND2X1 U2870 ( .A(chardata[1]), .B(n2349), .Y(n2345) );
  NAND2X1 U2871 ( .A(chardata[5]), .B(n2346), .Y(n2347) );
  OAI2BB1X1 U2872 ( .A0N(PATTERN[45]), .A1N(n2348), .B0(n2347), .Y(n880) );
  NAND2X1 U2873 ( .A(chardata[5]), .B(n2349), .Y(n2350) );
  NAND2X1 U2874 ( .A(chardata[5]), .B(n2352), .Y(n2353) );
  OAI2BB1X4 U2875 ( .A0N(PATTERN[21]), .A1N(n2354), .B0(n2353), .Y(n904) );
  NAND4XL U2876 ( .A(n1838), .B(n1238), .C(str_start_idx[5]), .D(
        str_start_idx[4]), .Y(n2355) );
  NOR2X1 U2877 ( .A(n1230), .B(n2355), .Y(n2356) );
  OR2X4 U2878 ( .A(n1308), .B(n2356), .Y(n2362) );
  AOI2BB2X4 U2879 ( .B0(n2362), .B1(n2361), .A0N(n2360), .A1N(str_start_idx[5]), .Y(n859) );
  OAI21XL U2880 ( .A0(isstring), .A1(str_count[0]), .B0(n2697), .Y(n2363) );
  OAI2BB1X1 U2881 ( .A0N(isstring_reg), .A1N(n2779), .B0(n2363), .Y(n1205) );
  NAND2X4 U2882 ( .A(n2385), .B(n2372), .Y(n2427) );
  NAND2X4 U2883 ( .A(n2370), .B(n2372), .Y(n2429) );
  NAND2X2 U2884 ( .A(n2429), .B(STRING[191]), .Y(n2371) );
  NAND2X4 U2885 ( .A(n2373), .B(n2372), .Y(n2431) );
  NAND2X1 U2886 ( .A(n1219), .B(STRING[17]), .Y(n2379) );
  NAND2X1 U2887 ( .A(n1218), .B(STRING[33]), .Y(n2380) );
  NAND2X1 U2888 ( .A(n1216), .B(STRING[25]), .Y(n2381) );
  NAND2BX2 U2889 ( .AN(n2386), .B(n2383), .Y(n2445) );
  NAND2BX2 U2890 ( .AN(n2386), .B(n2385), .Y(n2448) );
  NAND2X2 U2891 ( .A(n2485), .B(STRING[115]), .Y(n2397) );
  NAND2X2 U2892 ( .A(n2427), .B(STRING[176]), .Y(n2400) );
  NAND2X2 U2893 ( .A(n2429), .B(STRING[192]), .Y(n2401) );
  NAND2X2 U2894 ( .A(n2431), .B(STRING[184]), .Y(n2402) );
  NAND2X1 U2895 ( .A(n1219), .B(STRING[18]), .Y(n2404) );
  NAND2X1 U2896 ( .A(n1218), .B(STRING[34]), .Y(n2405) );
  NAND2X2 U2897 ( .A(n2427), .B(STRING[180]), .Y(n2409) );
  NAND2X2 U2898 ( .A(n2431), .B(STRING[188]), .Y(n2411) );
  NAND2X2 U2899 ( .A(n2485), .B(STRING[118]), .Y(n2414) );
  NAND2X2 U2900 ( .A(n2427), .B(STRING[174]), .Y(n2416) );
  NAND2X2 U2901 ( .A(n2431), .B(STRING[182]), .Y(n2418) );
  NAND2X2 U2902 ( .A(n2485), .B(STRING[116]), .Y(n2435) );
  NAND2X2 U2903 ( .A(n2427), .B(STRING[181]), .Y(n2437) );
  NAND2X2 U2904 ( .A(n2431), .B(STRING[189]), .Y(n2439) );
  NAND2X1 U2905 ( .A(n1219), .B(STRING[23]), .Y(n2441) );
  NAND2X1 U2906 ( .A(n1218), .B(STRING[39]), .Y(n2442) );
  NAND2X1 U2907 ( .A(n1217), .B(STRING[47]), .Y(n2443) );
  NAND2X1 U2908 ( .A(n2470), .B(n2466), .Y(n2467) );
  XNOR2X1 U2909 ( .A(pat_count[1]), .B(n2487), .Y(n2506) );
  XOR2X1 U2910 ( .A(n2506), .B(pat_count[0]), .Y(n2497) );
  CLKXOR2X2 U2911 ( .A(n1231), .B(n2488), .Y(n2573) );
  INVXL U2912 ( .A(n2573), .Y(n2490) );
  XNOR2X1 U2913 ( .A(n2489), .B(pat_count[0]), .Y(n2574) );
  AOI21X1 U2914 ( .A0(n2490), .A1(n2492), .B0(n2574), .Y(n2496) );
  AOI21XL U2915 ( .A0(n2695), .A1(n2492), .B0(n2500), .Y(n2491) );
  XOR2X1 U2916 ( .A(n2491), .B(pat_count[3]), .Y(n2495) );
  OAI21XL U2917 ( .A0(n2783), .A1(n1231), .B0(n2492), .Y(n2493) );
  NAND2XL U2918 ( .A(n2573), .B(n2493), .Y(n2494) );
  NAND4X1 U2919 ( .A(n2497), .B(n2496), .C(n2495), .D(n2494), .Y(n2512) );
  NOR2X1 U2920 ( .A(n2782), .B(n2500), .Y(n2504) );
  OAI21XL U2921 ( .A0(n2504), .A1(n1231), .B0(n2487), .Y(n2579) );
  OAI21XL U2922 ( .A0(n2579), .A1(pat_count[1]), .B0(n2573), .Y(n2509) );
  OAI21XL U2923 ( .A0(n2487), .A1(n2693), .B0(n2784), .Y(n2498) );
  NOR2X1 U2924 ( .A(n2573), .B(n2498), .Y(n2503) );
  NAND2X1 U2925 ( .A(n2501), .B(pat_count[3]), .Y(n2502) );
  NOR3X1 U2926 ( .A(n2503), .B(n2575), .C(n2574), .Y(n2508) );
  INVX1 U2927 ( .A(n2504), .Y(n2505) );
  NAND2X1 U2928 ( .A(n2506), .B(n2505), .Y(n2577) );
  NAND2X1 U2929 ( .A(n2577), .B(pat_count[0]), .Y(n2507) );
  OAI22X2 U2930 ( .A0(n2513), .A1(n2512), .B0(n2511), .B1(n2510), .Y(n2514) );
  NAND2X4 U2931 ( .A(n2515), .B(n2514), .Y(n2535) );
  XNOR2X1 U2932 ( .A(n2516), .B(n2791), .Y(n2519) );
  XNOR2X1 U2933 ( .A(n2517), .B(n2787), .Y(n2518) );
  NOR2X1 U2934 ( .A(n2519), .B(n2518), .Y(n2528) );
  XOR2XL U2935 ( .A(n2520), .B(n2781), .Y(n2523) );
  XOR2XL U2936 ( .A(n2779), .B(n2521), .Y(n2522) );
  NAND2X1 U2937 ( .A(n2523), .B(n2522), .Y(n2526) );
  XNOR2XL U2938 ( .A(n2524), .B(n2786), .Y(n2525) );
  NOR2X1 U2939 ( .A(n2526), .B(n2525), .Y(n2527) );
  NAND2X1 U2940 ( .A(n2528), .B(n2527), .Y(n2531) );
  XNOR2X1 U2941 ( .A(n2529), .B(n2797), .Y(n2530) );
  NOR2X1 U2942 ( .A(n2531), .B(n2530), .Y(n2533) );
  AOI22X1 U2943 ( .A0(ispattern), .A1(n2785), .B0(n2533), .B1(n2532), .Y(n2534) );
  NAND2X4 U2944 ( .A(n2535), .B(n2534), .Y(next_state[0]) );
  OAI21XL U2945 ( .A0(n1229), .A1(n2565), .B0(n2536), .Y(n850) );
  MXI2X1 U2946 ( .A(n2555), .B(n2537), .S0(n1238), .Y(n2539) );
  NOR2X1 U2947 ( .A(n2565), .B(star_exit_start_idx[0]), .Y(n2538) );
  OR2X4 U2948 ( .A(n2540), .B(n2696), .Y(n2546) );
  INVX1 U2949 ( .A(n2541), .Y(n2543) );
  NAND2XL U2950 ( .A(star_exit_start_idx[0]), .B(star_exit_start_idx[1]), .Y(
        n2542) );
  AOI21X1 U2951 ( .A0(n2543), .A1(n2542), .B0(n2565), .Y(n2544) );
  NOR2X1 U2952 ( .A(n2560), .B(n2544), .Y(n2545) );
  AOI21X1 U2953 ( .A0(n2546), .A1(n2545), .B0(n2586), .Y(N773) );
  NAND2X4 U2954 ( .A(n2547), .B(n1838), .Y(n2558) );
  NOR2X1 U2955 ( .A(n2548), .B(star_exit_start_idx[3]), .Y(n2563) );
  NAND2X1 U2956 ( .A(n2550), .B(n2549), .Y(n2556) );
  NOR2X1 U2957 ( .A(n2552), .B(n2551), .Y(n2561) );
  AOI2BB2X1 U2958 ( .B0(star_exit), .B1(n2556), .A0N(n2555), .A1N(n2554), .Y(
        n2557) );
  AOI21X1 U2959 ( .A0(n2558), .A1(n2557), .B0(n2586), .Y(N775) );
  NAND2X1 U2960 ( .A(n2562), .B(n2561), .Y(n2567) );
  NOR2XL U2961 ( .A(n2618), .B(star_exit), .Y(n2566) );
  XNOR2X1 U2962 ( .A(n2563), .B(star_exit_start_idx[4]), .Y(n2564) );
  AOI2BB2X1 U2963 ( .B0(n2567), .B1(n2566), .A0N(n2565), .A1N(n2564), .Y(n2568) );
  AOI21X1 U2964 ( .A0(n2569), .A1(n2568), .B0(n2586), .Y(N776) );
  NOR2X1 U2965 ( .A(pat_count[1]), .B(n2694), .Y(n2578) );
  INVX1 U2966 ( .A(n2578), .Y(n2572) );
  NAND2XL U2967 ( .A(n2487), .B(is_check_point_match), .Y(n2570) );
  NOR2X1 U2968 ( .A(n2573), .B(n2570), .Y(n2571) );
  AOI21X1 U2969 ( .A0(n2573), .A1(n2572), .B0(n2571), .Y(n2583) );
  INVX1 U2970 ( .A(n2574), .Y(n2576) );
  NAND2X1 U2971 ( .A(n2577), .B(n2694), .Y(n2581) );
  NAND2X1 U2972 ( .A(n2579), .B(n2578), .Y(n2580) );
  NAND4X1 U2973 ( .A(n2583), .B(n2582), .C(n2581), .D(n2580), .Y(n2584) );
  NOR2X1 U2974 ( .A(n2586), .B(n2584), .Y(N699) );
endmodule

