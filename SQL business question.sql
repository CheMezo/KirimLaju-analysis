-- Hitung jumlah shipment per service_type
SELECT
    service_type,
    COUNT(shipment_id) AS total_shipment,
    ROUND(
        COUNT(shipment_id) * 100.0 / ROUND(SUM(COUNT(*)) OVER (),
        2)
    ) AS shipment_share_pct
FROM shipments
GROUP BY service_type;

-- Bandingin jumlah order sama total_cost_idr per layanan
SELECT
	service_type,
	count(shipment_id) AS total_order,
    sum(total_cost_idr) AS total_cost
FROM shipments
group by service_type;

-- Cek rata-rata ongkos per kiriman di tiap layanan
SELECT 
	DISTINCT service_type,
    AVG(total_cost_idr) over (PARTITION BY service_type) as avg_cost_per_shipment
FROM shipments;

