import com.nfwork.dbfound.core.Context;
import com.nfwork.dbfound.core.Transaction;
import com.nfwork.dbfound.model.ModelEngine;

public class Test {

    /**
     * @param args
     */
    public static void main(String[] args) {
//        DBFoundConfig.init("${@projectRoot}/WEB-INF/dbfound-conf.xml");
//        new Test().save();
        System.out.println("test");
    }


    public void save() {

        Context context = new Context();
        context.setParamData("user_name", "小杨");
        context.setParamData("role_id", "6");
        context.setParamData("password", "123");
        context.setParamData("status", "Y");

        Transaction transaction = context.getTransaction();
        try {
            transaction.begin();

            save1(context);
            save2(context);

            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            transaction.end();
        }

    }

    private void save1(Context context) {
        context.setParamData("user_name", "小杨");
        context.setParamData("role_id", "6");
        context.setParamData("password", "123");
        context.setParamData("status", "Y");

        ModelEngine.execute(context, "sys/user", "update");

    }

    private void save2(Context context) {
        context.setParamData("user_name", "小杨8978");
        context.setParamData("role_id", "6");
        context.setParamData("password", "123");
        context.setParamData("status", "Y");

        ModelEngine.execute(context, "sys/user", "update");
        if (1 == 1) {
            throw new RuntimeException("hello kity");
        }

    }

}
