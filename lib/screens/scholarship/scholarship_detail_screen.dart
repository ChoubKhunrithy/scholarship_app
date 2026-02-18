// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:scholarship_app/l10n/app_localizations.dart';

class ScholarshipDetailScreen extends StatefulWidget {
  const ScholarshipDetailScreen({super.key});

  @override
  State<ScholarshipDetailScreen> createState() =>
      _ScholarshipDetailScreenState();
}

class _ScholarshipDetailScreenState extends State<ScholarshipDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 30,
            color: colorScheme.onPrimary,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          t.translate('detailTitle'),
          style: TextStyle(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderImage(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.translate('detailScholarshipTitle'),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 16, color: colorScheme.outline),
                        SizedBox(width: 6),
                        Text(
                          t.translate('detailScholarshipLocation'),
                          style: TextStyle(
                            fontSize: 14,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildDeadlineCard(context, colorScheme),
                    const SizedBox(height: 16),
                    _buildSectionTitle(
                        context, t.translate('detailAboutTitle'), colorScheme),
                    SizedBox(height: 6),
                    Text(
                      t.translate('detailAboutDescription'),
                      style: TextStyle(
                        height: 1.4,
                        fontSize: 13,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildSectionTitle(context,
                        t.translate('detailBenefitsTitle'), colorScheme),
                    SizedBox(height: 8),
                    _buildRequirementBullet(
                        t.translate('detailBenefit1'), colorScheme),
                    _buildRequirementBullet(
                        t.translate('detailBenefit2'), colorScheme),
                    _buildRequirementBullet(
                        t.translate('detailBenefit3'), colorScheme),
                    _buildRequirementBullet(
                        t.translate('detailBenefit4'), colorScheme),
                    SizedBox(height: 16),
                    _buildSectionTitle(context,
                        t.translate('detailEligibilityTitle'), colorScheme),
                    SizedBox(height: 8),
                    _buildRequirementBullet(
                        t.translate('detailRequirement1'), colorScheme),
                    _buildRequirementBullet(
                        t.translate('detailRequirement2'), colorScheme),
                    _buildRequirementBullet(
                        t.translate('detailRequirement3'), colorScheme),
                    _buildRequirementBullet(
                        t.translate('detailRequirement4'), colorScheme),
                    const SizedBox(height: 16),
                    _buildSectionTitle(context,
                        t.translate('detailDocumentsTitle'), colorScheme),
                    SizedBox(height: 10),
                    _buildStepItem(
                      number: 1,
                      text: t.translate('detailDocument1'),
                      colorScheme: colorScheme,
                    ),
                    const SizedBox(height: 8),
                    _buildStepItem(
                      number: 2,
                      text: t.translate('detailDocument2'),
                      colorScheme: colorScheme,
                    ),
                    const SizedBox(height: 8),
                    _buildStepItem(
                      number: 3,
                      text: t.translate('detailDocument3'),
                      colorScheme: colorScheme,
                    ),
                    const SizedBox(height: 8),
                    _buildStepItem(
                      number: 4,
                      text: t.translate('detailDocument4'),
                      colorScheme: colorScheme,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              t.translate('detailApplyButton'),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return ClipRRect(
      child: Image.asset(
        'assets/images/detail_rupp.png',
        height: 180,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDeadlineCard(BuildContext context, ColorScheme colorScheme) {
    final t = AppLocalizations.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorScheme.outline.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today, size: 18, color: colorScheme.error),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.translate('detailDeadlineLabel'),
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                t.translate('detailDeadlineDate'),
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            t.translate('detailDaysRemaining'),
            style: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
      BuildContext context, String title, ColorScheme colorScheme) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
    );
  }

  Widget _buildRequirementBullet(String text, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: TextStyle(fontSize: 13, color: colorScheme.onSurface),
      ),
    );
  }

  Widget _buildStepItem(
      {required int number,
      required String text,
      required ColorScheme colorScheme}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '$number',
            style: TextStyle(
              color: colorScheme.onPrimary,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: colorScheme.onSurface),
          ),
        ),
      ],
    );
  }
}
