import 'package:flutter/material.dart';

import '../Widgets/RowBuilder.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Text(
            'd',
            style: TextStyle(fontSize: 2),
          ),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 20),
            child: ListView(
              children: [
                TaskListItem(
                  task: 'go go go work like a hore bitch come on on the pool',
                  priority: PriorityType.High,
                  project: Project(
                      projectTitle: 'inbox',
                      color: Colors.red,
                      icon: Icons.accessible),
                ),
                TaskListItem(
                  task:
                      'go go go work like a hore bitch come on on the pool pool pool cool game on the planet earth go on the',
                  priority: PriorityType.High,
                  project: Project(
                      projectTitle: 'inbox',
                      color: Colors.red,
                      icon: Icons.accessible),
                ),
                TaskListItem(
                  task: 'go go go work like a hore bitch come on',
                  priority: PriorityType.High,
                  project: Project(
                      projectTitle: 'inbox',
                      color: Colors.red,
                      icon: Icons.accessible),
                ),
              ],
            )));
  }
}

//! //////////////////////////////////////////////////////////////////////////
//! ////////////////////////////////////////////////////////////////////////////
// -- The section below shuld cute this widget is complited ------------------

class Label {
  final String labelTitle;
  final Color color;

  Label({this.labelTitle, this.color});
}

class Project {
  final String projectTitle;
  final Color color;
  final IconData icon;

  Project({this.projectTitle, this.color, this.icon});
}

enum PriorityType { Normal, Low, Medium, High }

class TaskListItem extends StatefulWidget {
  // Remove the Final if you got any problem

  /// Task Id For drag and drop to swipe the id to another Task
  final int id;

  /// Task content
  final String task;

  /// the Priority of task from #Normal to #Low , #Medium to #High
  final PriorityType priority;

  /// By default this set to False . It is for checking the task is Done or not.
  final bool isDone;

  /// Task Project name , by default this set to #Index.
  final Project project;

  /// List of Task labels
  final List<Label> labels;

  final doItDate;

  TaskListItem(
      {this.id,
      this.task,
      this.priority,
      this.isDone = false,
      this.project,
      this.labels,
      this.doItDate});

  @override
  _TaskListItemState createState() => _TaskListItemState(this.isDone);
}

class _TaskListItemState extends State<TaskListItem> {
  bool isDone;
  _TaskListItemState(this.isDone);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                prioritySideColor(),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    setState(() {
                      this.isDone = !this.isDone;
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 150),
                        width: 23,
                        height: 23,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: this.isDone ? Colors.grey : null,
                            borderRadius: BorderRadius.circular(7),
                            border: this.isDone
                                ? Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.grey,
                                    width: 0)
                                : Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.grey,
                                    width: 2)),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: this.isDone ? 22 : 0,
                        ),
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 70,
                          child: RichText(
                            text: TextSpan(
                                text: widget.task != null
                                    ? widget.task //!    Task content
                                    : '',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: this.isDone
                                        ? Colors.black38
                                        : Colors.black,
                                    decoration: this.isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                                children: [
                                  TextSpan(
                                      text:
                                          widget.doItDate != null ? ' | ' : '',
                                      style: TextStyle(
                                        color: Colors.red.withOpacity(.7),
                                      )),
                                  TextSpan(
                                      text: widget.doItDate != null
                                          ? widget.doItDate   // ! Date of to do 
                                          : '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          // shadows: [
                                          //   Shadow(
                                          //       blurRadius: 2.5,
                                          //       color: Colors.black,
                                          //       offset: Offset(.8, .8))
                                          // ],
                                          letterSpacing: 2,
                                          color: Colors.red.withOpacity(.7),
                                          fontSize: 12))
                                ]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // color: Colors.amber, //! -- Test color --
                      width: MediaQuery.of(context).size.width - 72,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              RowBuilder(
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    // height: 2,
                                    // width: 10,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.blue,
                                    ),
                                    child: Text(
                                      'gym',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.project != null
                                      ? widget.project.projectTitle
                                      : '',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                widget.project.icon != null
                                    ? Icon(
                                        widget.project.icon,
                                        color: widget.project.color,
                                        size: 15,
                                      )
                                    : Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 2),
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                            color: widget.project.color,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }

  /// This is priority Sidebar color -------------------------------------------
  Widget prioritySideColor() {
    Color priorityColor;
    switch (widget.priority) {
      case PriorityType.Low:
        priorityColor = Colors.blue;
        break;
      case PriorityType.Medium:
        priorityColor = Colors.yellow[800];
        break;
      case PriorityType.High:
        priorityColor = Colors.red;
        break;
      default:
        priorityColor = Colors.grey;
    }
    return Container(
      width: 4,
      // height: 50,
      decoration: BoxDecoration(
        color: priorityColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
    );
  }
// ----End    ------------------------------------------------------------------
}
