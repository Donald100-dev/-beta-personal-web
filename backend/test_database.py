import unittest

from database import SessionLocal, create_story, delete_story, get_all_stories, update_story


class DatabaseSmokeTest(unittest.TestCase):
    def setUp(self):
        self.db = SessionLocal()

    def tearDown(self):
        self.db.close()

    def test_story_crud_flow(self):
        initial_count = len(get_all_stories(self.db))

        story = create_story(
            self.db,
            title="Test story",
            path_page="https://example.com/test-story",
            thumbnail="https://example.com/test.jpg",
        )

        self.assertIsNotNone(story.id)
        self.assertEqual(story.title, "Test story")

        stories = get_all_stories(self.db)
        self.assertGreaterEqual(len(stories), initial_count + 1)

        updated_story = update_story(self.db, story.id, title="Updated test story")
        self.assertIsNotNone(updated_story)
        self.assertEqual(updated_story.title, "Updated test story")

        deleted = delete_story(self.db, story.id)
        self.assertTrue(deleted)


if __name__ == "__main__":
    unittest.main()
