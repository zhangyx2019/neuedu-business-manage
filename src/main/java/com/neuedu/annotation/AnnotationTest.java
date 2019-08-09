package com.neuedu.annotation;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;

public class AnnotationTest {
    public static void main(String[] args) {
        try {
            Class c=Class.forName("com.neuedu.pojo.UserInfo");

            boolean isexistsTableAnnotation=c.isAnnotationPresent(Table.class);
            if(isexistsTableAnnotation){
                Table table=(Table) c.getAnnotation(Table.class);
                System.out.println(table.value());
            }

            Field[] fields=c.getDeclaredFields();
            for(Field field:fields){
                boolean isexistscolumnAnotation=field.isAnnotationPresent(Column.class);
                if(isexistscolumnAnotation){
                    Column column=(Column)field.getAnnotation(Column.class);
                    System.out.println("get"+column.value().substring(0,1).toUpperCase()+column.value().substring(1)+"()");
                    Method method=c.getMethod("get"+column.value().substring(0,1).toUpperCase()+column.value().substring(1)+"()");
                    System.out.println(method.invoke(c.getClass(),null));
                }
            }



        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }
}
