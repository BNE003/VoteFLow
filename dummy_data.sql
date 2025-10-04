-- Dummy Data for FeatureFlow Demo
-- App: UniMath (app_id: unimath-ch875n)
-- Math Learning App with realistic feature requests

-- Insert Features with high vote counts and time distribution
INSERT INTO features (id, app_id, title, description, status, votes_count, created_at) VALUES
-- Completed features (older dates)
('a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'unimath-ch875n', 'Step-by-Step Solutions', 'Please add detailed step-by-step explanations for solving equations. It would help me understand the process better.', 'completed', 847, '2024-06-15 08:30:00+00'),
('b2c3d4e5-f6a7-4b5c-9d0e-1f2a3b4c5d6e', 'unimath-ch875n', 'Dark Mode Support', 'My eyes hurt when studying at night. A dark mode would be amazing for late-night study sessions.', 'completed', 623, '2024-07-22 14:20:00+00'),

-- In Progress features (medium dates)
('c3d4e5f6-a7b8-4c5d-0e1f-2a3b4c5d6e7f', 'unimath-ch875n', 'Offline Mode', 'Allow downloading lessons for offline study. Sometimes I don''t have internet access on my commute.', 'in_progress', 542, '2024-08-10 10:15:00+00'),
('d4e5f6a7-b8c9-4d5e-1f2a-3b4c5d6e7f8a', 'unimath-ch875n', 'Practice Test Generator', 'Generate random practice tests based on selected topics to help prepare for exams.', 'in_progress', 431, '2024-09-05 16:45:00+00'),

-- Planned features (newer dates)
('e5f6a7b8-c9d0-4e5f-2a3b-4c5d6e7f8a9b', 'unimath-ch875n', 'Handwriting Recognition', 'Let me write equations with Apple Pencil instead of typing them. Would make solving much faster!', 'planned', 389, '2024-10-12 09:30:00+00'),
('f6a7b8c9-d0e1-4f5a-3b4c-5d6e7f8a9b0c', 'unimath-ch875n', 'Video Tutorials', 'Add short video explanations for complex topics like calculus and linear algebra.', 'planned', 276, '2024-11-18 13:20:00+00'),

-- Open features (recent dates)
('a7b8c9d0-e1f2-4a5b-4c5d-6e7f8a9b0c1d', 'unimath-ch875n', 'Study Streak Counter', 'Gamify learning with daily streak counters and achievements to keep me motivated.', 'open', 512, '2024-12-02 11:00:00+00'),
('b8c9d0e1-f2a3-4b5c-5d6e-7f8a9b0c1d2e', 'unimath-ch875n', 'Graphing Calculator', 'Built-in graphing calculator for plotting functions would be super useful for calculus.', 'open', 468, '2024-12-15 15:30:00+00'),
('c9d0e1f2-a3b4-4c5d-6e7f-8a9b0c1d2e3f', 'unimath-ch875n', 'Widget for Quick Formulas', 'Home screen widget showing common formulas I can reference quickly during homework.', 'open', 334, '2025-01-08 10:45:00+00'),
('d0e1f2a3-b4c5-4d5e-7f8a-9b0c1d2e3f4a', 'unimath-ch875n', 'Collaborative Study Rooms', 'Create virtual study rooms where friends can solve problems together in real-time.', 'open', 298, '2025-01-22 14:15:00+00'),
('e1f2a3b4-c5d6-4e5f-8a9b-0c1d2e3f4a5b', 'unimath-ch875n', 'LaTeX Export', 'Export my solutions as LaTeX code so I can include them in my thesis papers.', 'open', 187, '2025-02-03 09:20:00+00'),
('f2a3b4c5-d6e7-4f5a-9b0c-1d2e3f4a5b6c', 'unimath-ch875n', 'Voice Input for Equations', 'Speak equations out loud and have them converted to math notation automatically.', 'open', 156, '2025-02-14 16:50:00+00'),
('a3b4c5d6-e7f8-4a5b-0c1d-2e3f4a5b6c7d', 'unimath-ch875n', 'AR Geometry Visualizer', 'Use AR to visualize 3D geometric shapes and transformations in real space.', 'open', 423, '2025-02-28 12:30:00+00'),
('b4c5d6e7-f8a9-4b5c-1d2e-3f4a5b6c7d8e', 'unimath-ch875n', 'Statistics Dashboard', 'Show my learning progress with charts - topics mastered, time spent, accuracy rates.', 'open', 201, '2025-03-10 08:40:00+00');

-- Insert Comments (realistic discussions)
INSERT INTO comments (id, feature_id, author_name, text, created_at) VALUES
-- Comments for Step-by-Step Solutions
('c1a1a1a1-1111-4111-1111-111111111111', 'a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'Sarah M.', 'This would be incredibly helpful for learning! Please add this.', '2024-06-15 10:30:00+00'),
('c1a1a1a1-2222-4222-2222-222222222222', 'a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'Michael K.', 'YES! Khan Academy has this and it''s amazing for understanding concepts.', '2024-06-16 14:20:00+00'),
('c1a1a1a1-3333-4333-3333-333333333333', 'a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'Emma T.', 'Just tried the new update - the step-by-step feature is PERFECT! Thank you!', '2024-08-20 09:15:00+00'),

-- Comments for Dark Mode
('c2a2a2a2-1111-4111-1111-111111111111', 'b2c3d4e5-f6a7-4b5c-9d0e-1f2a3b4c5d6e', 'David L.', 'Please make it OLED-friendly with true black backgrounds!', '2024-07-22 15:45:00+00'),
('c2a2a2a2-2222-4222-2222-222222222222', 'b2c3d4e5-f6a7-4b5c-9d0e-1f2a3b4c5d6e', 'Lisa W.', 'This is essential. All apps should have dark mode in 2024.', '2024-07-23 11:30:00+00'),

-- Comments for Handwriting Recognition
('c3a3a3a3-1111-4111-1111-111111111111', 'e5f6a7b8-c9d0-4e5f-2a3b-4c5d6e7f8a9b', 'Alex P.', 'MyScript has great handwriting recognition. Maybe partner with them?', '2024-10-12 11:20:00+00'),
('c3a3a3a3-2222-4222-2222-222222222222', 'e5f6a7b8-c9d0-4e5f-2a3b-4c5d6e7f8a9b', 'Sophia R.', 'This would make the iPad version so much better for students!', '2024-10-13 16:40:00+00'),
('c3a3a3a3-3333-4333-3333-333333333333', 'e5f6a7b8-c9d0-4e5f-2a3b-4c5d6e7f8a9b', 'James H.', 'Make sure it works with both Apple Pencil and finger input please.', '2024-10-15 09:50:00+00'),

-- Comments for Graphing Calculator
('c4a4a4a4-1111-4111-1111-111111111111', 'b8c9d0e1-f2a3-4b5c-5d6e-7f8a9b0c1d2e', 'Oliver S.', 'Desmos integration would be amazing!', '2024-12-16 08:30:00+00'),
('c4a4a4a4-2222-4222-2222-222222222222', 'b8c9d0e1-f2a3-4b5c-5d6e-7f8a9b0c1d2e', 'Emma C.', 'Please add support for parametric and polar coordinates too.', '2024-12-18 13:15:00+00'),

-- Comments for Study Streak Counter
('c5a5a5a5-1111-4111-1111-111111111111', 'a7b8c9d0-e1f2-4a5b-4c5d-6e7f8a9b0c1d', 'Noah B.', 'Duolingo-style streaks would keep me coming back daily!', '2024-12-03 10:20:00+00'),
('c5a5a5a5-2222-4222-2222-222222222222', 'a7b8c9d0-e1f2-4a5b-4c5d-6e7f8a9b0c1d', 'Ava M.', 'Add badges for milestones like 7 days, 30 days, 100 days!', '2024-12-05 15:45:00+00'),

-- Comments for AR Geometry
('c6a6a6a6-1111-4111-1111-111111111111', 'a3b4c5d6-e7f8-4a5b-0c1d-2e3f4a5b6c7d', 'Liam F.', 'This sounds futuristic but would be incredible for understanding 3D geometry!', '2025-03-01 11:30:00+00'),
('c6a6a6a6-2222-4222-2222-222222222222', 'a3b4c5d6-e7f8-4a5b-0c1d-2e3f4a5b6c7d', 'Mia K.', 'Similar to GeoGebra AR? That app is amazing for visualizing math.', '2025-03-02 14:20:00+00'),

-- Comments for Video Tutorials
('c7a7a7a7-1111-4111-1111-111111111111', 'f6a7b8c9-d0e1-4f5a-3b4c-5d6e7f8a9b0c', 'Ethan J.', 'Short 2-3 minute videos would be perfect. Keep them concise!', '2024-11-19 09:40:00+00'),
('c7a7a7a7-2222-4222-2222-222222222222', 'f6a7b8c9-d0e1-4f5a-3b4c-5d6e7f8a9b0c', 'Isabella N.', 'Please add downloadable videos for offline watching.', '2024-11-21 16:25:00+00');

-- Insert Votes (distributed across features for realistic vote counts)
-- Note: In production, you'd need to generate hundreds of individual votes
-- This is a simplified version showing the structure

INSERT INTO votes (id, feature_id, user_identifier, created_at) VALUES
-- Sample votes for Step-by-Step Solutions (847 votes - showing just a few)
('11111111-1111-4111-1111-111111111111', 'a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'device-user-001', '2024-06-15 09:00:00+00'),
('11111111-1111-4111-1111-111111111112', 'a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'device-user-002', '2024-06-15 10:30:00+00'),
('11111111-1111-4111-1111-111111111113', 'a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'device-user-003', '2024-06-15 11:45:00+00'),

-- Sample votes for Dark Mode (623 votes)
('22222222-2222-4222-2222-222222222221', 'b2c3d4e5-f6a7-4b5c-9d0e-1f2a3b4c5d6e', 'device-user-004', '2024-07-22 15:00:00+00'),
('22222222-2222-4222-2222-222222222222', 'b2c3d4e5-f6a7-4b5c-9d0e-1f2a3b4c5d6e', 'device-user-005', '2024-07-22 16:20:00+00'),

-- Sample votes for other features
('33333333-3333-4333-3333-333333333331', 'c3d4e5f6-a7b8-4c5d-0e1f-2a3b4c5d6e7f', 'device-user-006', '2024-08-10 11:00:00+00'),
('44444444-4444-4444-4444-444444444441', 'd4e5f6a7-b8c9-4d5e-1f2a-3b4c5d6e7f8a', 'device-user-007', '2024-09-05 17:30:00+00'),
('55555555-5555-4555-5555-555555555551', 'e5f6a7b8-c9d0-4e5f-2a3b-4c5d6e7f8a9b', 'device-user-008', '2024-10-12 10:15:00+00'),
('66666666-6666-4666-6666-666666666661', 'f6a7b8c9-d0e1-4f5a-3b4c-5d6e7f8a9b0c', 'device-user-009', '2024-11-18 14:00:00+00'),
('77777777-7777-4777-7777-777777777771', 'a7b8c9d0-e1f2-4a5b-4c5d-6e7f8a9b0c1d', 'device-user-010', '2024-12-02 12:00:00+00'),
('88888888-8888-4888-8888-888888888881', 'b8c9d0e1-f2a3-4b5c-5d6e-7f8a9b0c1d2e', 'device-user-011', '2024-12-15 16:45:00+00'),
('99999999-9999-4999-9999-999999999991', 'c9d0e1f2-a3b4-4c5d-6e7f-8a9b0c1d2e3f', 'device-user-012', '2025-01-08 11:30:00+00'),
('aaaaaaaa-aaaa-4aaa-aaaa-aaaaaaaaaaa1', 'd0e1f2a3-b4c5-4d5e-7f8a-9b0c1d2e3f4a', 'device-user-013', '2025-01-22 15:00:00+00');

-- Insert Usage Metrics (for dashboard graphs)
INSERT INTO usage_metrics (id, app_id, month, features_count, votes_count, comments_count, created_at) VALUES
('11111111-1111-4111-1111-11111111111a', 'unimath-ch875n', '2024-06', 1, 847, 3, '2024-06-30 23:59:59+00'),
('22222222-2222-4222-2222-22222222222a', 'unimath-ch875n', '2024-07', 2, 1470, 5, '2024-07-31 23:59:59+00'),
('33333333-3333-4333-3333-33333333333a', 'unimath-ch875n', '2024-08', 3, 2012, 5, '2024-08-31 23:59:59+00'),
('44444444-4444-4444-4444-44444444444a', 'unimath-ch875n', '2024-09', 4, 2443, 5, '2024-09-30 23:59:59+00'),
('55555555-5555-4555-5555-55555555555a', 'unimath-ch875n', '2024-10', 5, 2832, 8, '2024-10-31 23:59:59+00'),
('66666666-6666-4666-6666-66666666666a', 'unimath-ch875n', '2024-11', 6, 3108, 10, '2024-11-30 23:59:59+00'),
('77777777-7777-4777-7777-77777777777a', 'unimath-ch875n', '2024-12', 8, 3620, 14, '2024-12-31 23:59:59+00'),
('88888888-8888-4888-8888-88888888888a', 'unimath-ch875n', '2025-01', 10, 4252, 14, '2025-01-31 23:59:59+00'),
('99999999-9999-4999-9999-99999999999a', 'unimath-ch875n', '2025-02', 13, 4975, 14, '2025-02-28 23:59:59+00'),
('aaaaaaaa-aaaa-4aaa-aaaa-aaaaaaaaaaa2', 'unimath-ch875n', '2025-03', 14, 5599, 16, '2025-03-15 12:00:00+00');

-- Summary Statistics
-- Total Features: 14
-- Total Votes: 5,599 (distributed across features)
-- Total Comments: 16
-- Date Range: June 2024 - March 2025 (10 months of data for nice graphs)
-- Status Distribution:
--   - Completed: 2
--   - In Progress: 2
--   - Planned: 2
--   - Open: 8
