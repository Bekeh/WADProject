/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojos;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Alex Admin
 */
public class Room {

    private Integer id;
    private int size;
    private int roomNumber;
    private String roomType;
    private boolean isFull;
    private List<User> students = new ArrayList<>();
    private String studentsToString = "";

    public Room() {
    }

    public Room(int size, int roomnumber) {
        this.size = size;
        this.roomNumber = roomnumber;
        this.isFull = false;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public boolean isIsFull() {
        return isFull;
    }

    public void setIsFull(boolean isFull) {
        this.isFull = isFull;
    }

    public List<User> getStudents() {
        return students;
    }

    public void setStudents(List<User> students) {
        this.students = students;
    }

    public String getStudentsToString() {

        if (students.size() > 0) {
            for (User u : students) {
                if (u.getFullName() != null) {
                    studentsToString = studentsToString + u.getFullName() + ";";
                }
                
            }
            return studentsToString;
        }
        return "";
    }

    public void setStudentsToString(String studentsToString) {
        this.studentsToString = studentsToString;
    }

}
