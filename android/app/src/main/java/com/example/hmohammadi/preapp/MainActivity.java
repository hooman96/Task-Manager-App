package com.example.hmohammadi.preapp;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    ArrayList<String> toDoItems;
    ArrayAdapter<String> aToDoitemsAdapter;
    ListView lvItems;
    EditText etEditText;

    public void populateArrayItems() {
        toDoItems = new ArrayList<String>();

        readItems();

        aToDoitemsAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, toDoItems);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        populateArrayItems();
        lvItems = (ListView) findViewById(R.id.lvItems);
        lvItems.setAdapter(aToDoitemsAdapter);
        etEditText = (EditText) findViewById(R.id.etEditText);

        lvItems.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                toDoItems.remove(i);
                aToDoitemsAdapter.notifyDataSetChanged();
                writeItems();
                return true;
            }
        });
    }

    public void onAddItem(View view) {
        aToDoitemsAdapter.add(etEditText.getText().toString());
        etEditText.setText("");

        writeItems();
    }

    private void readItems() {
        File fileDir = getFilesDir();
        File file = new File(fileDir, "todo.txt");

        try {
            toDoItems = new ArrayList<String>(FileUtils.readLines(file));
        } catch (IOException e) {
            return;
        }
    }

    private void writeItems() {
        File fileDir = getFilesDir();
        File file = new File(fileDir, "todo.txt");

        try {
            FileUtils.writeLines(file, toDoItems);
        } catch (IOException e) {
            return;
        }
    }
}
