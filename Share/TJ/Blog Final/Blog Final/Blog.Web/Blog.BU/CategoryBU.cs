using System.Data;
using Blog.Dao;
using Blog.Entities;

namespace Blog.BU
{
    public static class CategoryBU
    {
        public static DataTable SelectAllCategory()
        {
           

            return CategoryDao.SelectAllCategory();

        }
        public static DataTable SelectCategoryIdAndName()
        {


            return CategoryDao.SelectCategoryIdAndName();

        }
        public static bool UpdateCategory(Category category)
        {

            return CategoryDao.UpdateCategory(category);

        }

        public static bool DeleteCategory(Category category)
        {

            return CategoryDao.DeleteCategory(category);

        }
        public static bool InsertCategory(Category category)
        {

            return CategoryDao.InsertCategory(category);

        }
        public static DataTable SelectFullCategory()
        {


            return CategoryDao.SelectFullCategory();

        }

        public static DataTable SelectFullCategoryById(Category category)
        {


            return CategoryDao.GetFullCategoryById(category);

        }


    }
}
