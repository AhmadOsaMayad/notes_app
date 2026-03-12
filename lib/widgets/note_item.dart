import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/helpers/lan_detector.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    //consted
    return GestureDetector(
      onTap: () => _navigateToEdit(context),
      child: Container(
        padding: EdgeInsets.only(left: 16, bottom: 24, top: 24),
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: LanDetector.isArCrossAxis(isAr: note.isArContent),
          children: [_buildListTile(context), _buildDateText()],
        ),
      ),
    );
  }

  void _navigateToEdit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditNoteView(note: note)),
    );
  }

  // Extracted Container Decoration
  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Color(note.color),
      borderRadius: BorderRadius.circular(16),
    );
  }

  // Extracted ListTile Widget
  Widget _buildListTile(BuildContext context) {
    return ListTile(
      title: Text(
        note.title,
        textDirection: LanDetector.isArDir(isAr: note.isArTitle),
        textAlign: LanDetector.isArAl(isAr: note.isArTitle),
        style: const TextStyle(
          fontSize: 26,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          note.subtitle,
          textDirection: LanDetector.isArDir(isAr: note.isArContent),
          textAlign: LanDetector.isArAl(isAr: note.isArContent),
          style: TextStyle(
            fontSize: 18,
            color: Colors.black.withAlpha(128),
            fontWeight: FontWeight.bold,
          ),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: _buildDeleteButton(context),
    );
  }

  // Extracted Delete Button Logic
  Widget _buildDeleteButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: IconButton(
        onPressed: () => _showDeleteConfirmationDialog(context),
        icon: const Icon(FontAwesomeIcons.trash, size: 26, color: Colors.black),
      ),
    );
  }

  void _handleDeleteNote(context) {
    note.delete();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    Navigator.pop(context);
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete?", style: TextStyle(color: kPrimaryColor)),
          content: const Text("Note will be deleted permanently!"),
          actions: [
            TextButton(
              onPressed: () => _handleDeleteNote(context),
              child: const Text(
                "Delete",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Extracted Date Text Widget
  Widget _buildDateText() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Text(
        DateFormat("MMMM d, y  (hh:mm a)").format(DateTime.parse(note.date)),
        style: TextStyle(
          fontSize: 11,
          color: Colors.black.withAlpha(102),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
