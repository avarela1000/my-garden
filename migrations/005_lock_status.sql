CREATE TABLE bed_log_new (
    log_id   INTEGER PRIMARY KEY,
    bed_id   INTEGER NOT NULL REFERENCES bed(bed_id),
    log_date TEXT,
    status   TEXT CHECK (status IN ('seeded', 'sprouting', 'harvesting', 'fallow', 'failed'))
);

INSERT INTO bed_log_new (log_id, bed_id, log_date, status)
SELECT log_id, bed_id, log_date, status
FROM bed_log;

DROP TABLE bed_log;

ALTER TABLE bed_log_new RENAME TO bed_log;