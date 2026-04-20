-- ============================================
-- ROLLBACK TEST DATA - AIRLINE
-- ============================================

DELETE FROM airline WHERE airline_code IN ('AV', 'LA', 'AA', 'BA', 'AF');